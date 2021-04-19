# tpcds-kit

The official TPC-DS tools can be found at [tpc.org](http://tpc.org/tpc_documents_current_versions/current_specifications5.asp).

This version is based on v2.4 and has been modified to run on Azure Synapse with scripts supporting easy integration with Azure storage for generating data.

## Setup

### Linux

Make sure the required development tools are installed:

Ubuntu: 
```
sudo apt-get install gcc make flex bison byacc git
```

Install Azure CLI as it's needed to upload generated data to Azure storage account
```
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

Install sqlcmd to run the queries (Ubuntu 16.04, for other version go [here](https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-setup-tools))

```
# Import the public repository GPG keys. 
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

# Register the Microsoft Ubuntu repository.
curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list

# Update the sources list and run the installation command with the unixODBC developer package.
sudo apt-get update 
sudo apt-get install mssql-tools unixodbc-dev

# Optional: Add /opt/mssql-tools/bin/ to your PATH environment variable in a bash shell.
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
```

Then run the following commands to clone the repo and build the tools:

```
git clone https://github.com/databricks/tpcds-kit.git
cd tpcds-kit/tools
make OS=LINUX
```

## Using the TPC-DS tools

### Data generation

Data generation is done via `Generate-TPCDSData.sh [SCALE_FACTOR] [TMP_DIR] [CONTAINER_NAME] [DATA_DIR] [PARALLEL]`.
* `SCALE_FACTOR` - Scale Factor - The size of the data to be generated in Gigabytes, e.g. 1 = 1Gb
* `TMP_DIR` - Temporary directory - The generated data will be stored here before uploaded to ADLS Gen 2
* `CONTAINER_NAME` - ADLS Gen 2 Container name
* `DATA_DIR` - ADLS Gen 2 directory - Location where data will be uploaded in storage account
* `PARALLEL` - Number of files generated per table, minimum 2.

Following environmental variables need to be set
* `ACCOUNT_NAME` - ADLS Gen 2 account name 
* `ACCOUNT_KEY` - ADLS Gen 2 account key

### Loading to Synapse DW
Loading to Synapse is done via `COPY-TPCDSData.sh [SYNAPSE_URL] [DATABASE] [DATA_URL]`.
* `SYNAPSE_URL` - Server URL - Synapse SQL DW Endpoint
* `DATABASE` - Database name
* `DATA_URL` - URL to data directory storage account where generated data was uploaded storage account (only ADLS Gen 2 supported), e.g. https://<storage_account_name>.dfs.core.windows.net/tpcds/dataset-1TB

The list of tables to upload is sourced from **build_data_for_tables.txt**.

NOTE: The scripts uses Synapse Managed Identity, therefore, it needs at least **Storage Blob Data Reader role** on the storage account.

Following environmental variables need to be set
* `SYNAPSE_USER` - User name
* `SYNAPSE_USER_PWD` - User's password

### Query generation

Query generation is done via `Run-TPCDSTests.sh [SCALE_FACTOR] [SYNAPSE_URL] [DATABASE]`.  
* `SCALE_FACTOR` - Scale Factor - The size of the data to be generated in Gigabytes, e.g. 1 = 1Gb
* `SYNAPSE_URL` - Server URL - Synapse SQL DW Endpoint
* `DATABASE` - Database name

Following environmental variables need to be set
* `SYNAPSE_USER` - User name
* `SYNAPSE_USER_PWD` - User's password

NOTE: User must have set a default schema as schema is not part of the queries.