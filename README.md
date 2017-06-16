# problem statement
sets azure webapp configuration

# example usage

> note: in examples, VERSION represents a version of the azure.webapp.config.set pkg

## install

```shell
opctl pkg install github.com/opspec-pkgs/azure.webapp.config.set#VERSION
```

## run

```
opctl run github.com/opspec-pkgs/azure.webapp.config.set#VERSION
```

## compose

```yaml
run:
  op:
    pkg: { ref: github.com/opspec-pkgs/azure.webapp.config.set#VERSION }
    inputs: 
      subscriptionId:
      loginId:
      loginSecret:
      name:
      resourceGroup:
      # begin optional args
      alwaysOn:
      autoHealEnabled:
      javaContainer:
      javaContainerVersion:
      javaVersion:
      linuxFxVersion:
      netFrameworkVersion:
      phpVersion:
      pythonVersion:
      remoteDebuggingEnabled:
      slot:
      use32BitWorkerProcess:
      webSocketsEnabled:
      loginTenantId:
      loginType:
      # end optional args
```

