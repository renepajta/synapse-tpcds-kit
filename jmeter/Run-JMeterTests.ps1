function Run-JMeterTests (
    [string]$type
){

    $ErrorActionPreference = "Stop"

    switch ($type) {
        "synapse" { 
            $JMeterTestFile = Resolve-Path ".\TPC-DS Performance Benchmark - Synapse.jmx" 
        }
        "databricks" { 
            $JMeterTestFile = Resolve-Path ".\TPC-DS Performance Benchmark - Databricks.jmx" 
        }
        "sqlanalytics" { 
            $JMeterTestFile = Resolve-Path ".\TPC-DS Performance Benchmark - SQLAnalytics.jmx" 
        }
    }

    $config = Get-Content "config.json" | ConvertFrom-Json 

    $QueriesDirectory = Resolve-Path ".\queries"
    $QueriesConfig = Resolve-Path ".\queries\queries.csv"

    # Create a new result directory for this run
    if(!(Test-Path -Path $config.ResultsDirectory)) {
        $null = New-Item -ItemType directory -Path $config.ResultsDirectory
    }
    
    $RunDirectory = "run_{0}" -f $(Get-Date -f yyyyMMddhhmmss)
    $OutputDirectory =  Join-Path $(Resolve-Path $config.ResultsDirectory) $RunDirectory 
    $OutputResultFile = Join-Path $OutputDirectory "$type.csv"

    $command = "$($config.jmeterPath) -t '$JMeterTestFile' -l '$OutputResultFile' -JDatabricksDatabaseName='$($config.DatabricksDatabaseName)' -JDatabricksConnectionString='$($config.ConnectionStrings.DatabricksConnectionString)' -JSQLAnalyticsConnectionString='$($config.ConnectionStrings.SQLAnalyticsConnectionString)' -JSynapseConnectionString='$($config.ConnectionStrings.SynapseConnectionString)' -JNumberOfQueries='$($config.NumberOfQueries)' -JRepeatQueryCount=$($config.RepeatQueryCount) -JQueriesDirectory='$QueriesDirectory' -JQueriesConfig='$QueriesConfig' -JResultsDirectory='$OutputDirectory' -n -e" -replace  "'", '"' 

    $command = $command -replace "\\", "/"

    Write-Host "Starting JMeter with following parameters:"
    Write-Host $command

    Invoke-Expression $command

}

# Run-JMeterTests -type "databricks"
Run-JMeterTests -type "synapse"
# Run-JMeterTests -type "sqlanalytics"