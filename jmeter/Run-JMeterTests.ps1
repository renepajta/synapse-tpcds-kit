function Run-JMeterTests {

    $ErrorActionPreference = "Stop"

    $JMeterTestFile = Resolve-Path ".\TPC-DS Performance Benchmark.jmx"
    $config = Get-Content "config.json" | ConvertFrom-Json 

    # Create a new result directory for this run
    if(!(Test-Path -Path $config.ResultsDirectory)) {
        $null = New-Item -ItemType directory -Path $config.ResultsDirectory
    }
    
    $RunFolder = "run_{0}" -f $(Get-Date -f yyyyMMddhhmmss)
    $OutputFolder =  Join-Path $(Resolve-Path $config.ResultsDirectory) $RunFolder 
    $OutputResultFile = Join-Path $OutputFolder 'Results.csv' 

    $command = "$($config.jmeterPath) -n -e -t '$JMeterTestFile' -l '$OutputResultFile' -JDatabricksDatabaseName $($config.DatabricksDatabaseName) -JDatabricksConnectionString $($config.ConnectionStrings.DatabricksConnectionString) -JSQLAnalyticsConnectionString $($config.ConnectionStrings.SQLAnalyticsConnectionString) -JSynapseConnectionString $($config.ConnectionStrings.SynapseConnectionString) -JNumberOfQueries $($config.NumberOfQueries) -JRepeatQueryCount $($config.RepeatQueryCount) -JResultsDirectory '$OutputFolder'" -replace  "'", '"'

    Write-Host "Starting JMeter with following parameters:"
    Write-Host $command

    Invoke-Expression $command

}

Run-JMeterTests