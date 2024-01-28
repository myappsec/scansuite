## Static and Dynamic Security Analysis with ScanSuite 

ScanSuite is the self contained vulnerability scanning orchestrator for the code (SAST), Infrastructure as Code (IACS), Dependency (SCA / OSS), Dynamic Analysis (DAST) as well as Infrastructure assessment security tools.

### Install ScanSuite

```
./install-ubuntu dojo
```

### Set up connection with DefectDojo

Fetch the password:

```
./dojo-password
```

Locate the api key by visiting https://your-defectdojo-host:8443/api/key-v2

Copy the key and DefectDojo url to `scansuite/.env` file

### Start the ScanSuite

```
./start-scansuite
```

### (Optional) Set up connection with Snyk

* Create an account on Snyk `https://app.snyk.io/login`
* GoTo `https://app.snyk.io/org/cepxeo/manage/snyk-code` and Enable Snyk Code
* Then follow to `https://app.snyk.io/account/` and create the Auth Token

Set the token value in `scansuite-demo/.env` file