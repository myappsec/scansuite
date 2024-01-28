## Static and Dynamic Security Analysis with ScanSuite 

ScanSuite is the self contained vulnerability scanning orchestrator for the code (SAST), Infrastructure as Code (IACS), Dependency (SCA / OSS), Dynamic Analysis (DAST) as well as Infrastructure assessment security tools.

### Install ScanSuite

```
chmod +x install-ubuntu.sh
./install-ubuntu.sh
```

After installation you will find ScanSuite password here:

```
cat /var/tmp/scansuite.log | grep password
```

And DefectDojo password is here:

```
sudo docker-compose -f ~/apps/django-DefectDojo/docker-compose.yml logs initializer | grep "Admin password:"
```

### Set up connection with DefectDojo

Locate the api key by visiting https://your-defectdojo-host:8443/api/key-v2

Set environment variables in `scansuite-demo/.env` file

### (Optional) Set up connection with Snyk

* Create an account on Snyk `https://app.snyk.io/login`
* GoTo `https://app.snyk.io/org/cepxeo/manage/snyk-code` and Enable Snyk Code
* Then follow to `https://app.snyk.io/account/` and create the Auth Token

Set the token value in `scansuite-demo/.env` file

### Start the ScanSuite stack

```
cd scansuite-demo
docker-compose up -d
```

Open the browser and login to the console with the user `admin`

## Licence

All parts of the ScanSuite framework, including the source code belong to the author (Sergey Egorov) and may only be used for product demonstration purposes.