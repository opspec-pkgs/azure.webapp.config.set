#!/usr/bin/env sh

### begin login
loginCmd='az login -u "$loginId" -p "$loginSecret"'

# handle opts
if [ "$loginTenantId" != " " ]; then
    loginCmd=$(printf "%s --tenant %s" "$loginCmd" "$loginTenantId")
fi

case "$loginType" in
    "user")
        echo "logging in as user"
        ;;
    "sp")
        echo "logging in as service principal"
        loginCmd=$(printf "%s --service-principal" "$loginCmd")
        ;;
esac
eval "$loginCmd" >/dev/null

echo "setting default subscription"
az account set --subscription "$subscriptionId"
### end login

createCmd='az webapp config set'
createCmd=$(printf "%s --name %s" "$createCmd" "$name")
createCmd=$(printf "%s --resource-group %s" "$createCmd" "$resourceGroup")
createCmd=$(printf "%s --always-on %s" "$createCmd" "$alwaysOn" )
createCmd=$(printf "%s --auto-heal-enabled %s" "$createCmd" "$autoHealEnabled" )
createCmd=$(printf "%s --remote-debugging-enabled %s" "$createCmd" "$remoteDebuggingEnabled" )
createCmd=$(printf "%s --use-32bit-worker-process %s" "$createCmd" "$use32BitWorkerProcess" )
createCmd=$(printf "%s --web-sockets-enabled %s" "$createCmd" "$webSocketsEnabled" )

# handle opts
if [ "$javaContainer" != " " ]; then
createCmd=$(printf "%s --java-container %s" "$createCmd" "$javaContainer")
fi

if [ "$javaContainerVersion" != " " ]; then
createCmd=$(printf "%s --java-container-version %s" "$createCmd" "$javaContainerVersion")
fi

if [ "$javaVersion" != " " ]; then
createCmd=$(printf "%s --java-version %s" "$createCmd" "$javaVersion")
fi

if [ "$linuxFxVersion" != " " ]; then
createCmd=$(printf "%s --linux-fx-version %s" "$createCmd" "$linuxFxVersion")
fi

if [ "$netFrameworkVersion" != " " ]; then
createCmd=$(printf "%s --net-framework-version %s" "$createCmd" "$netFrameworkVersion")
fi

if [ "$phpVersion" != " " ]; then
createCmd=$(printf "%s --php-version %s" "$createCmd" "$phpVersion")
fi

if [ "$pythonVersion" != " " ]; then
createCmd=$(printf "%s --python-version %s" "$createCmd" "$pythonVersion")
fi

if [ "$slot" != " " ]; then
createCmd=$(printf "%s --slot %s" "$createCmd" "$slot")
fi

echo "setting webapp config"
eval "$createCmd"