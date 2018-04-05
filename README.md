# s2i-oc-observe
An s2i to enable use of the oc observe command

# Run environment variable options
 - `RESOURCE`: The resource to observe 
 - `OBSERVE_ARGS`: The arguments to pass to `oc observe`
 - `SCRIPT_PATH`: The path of the script to execute

# Make the image

Simply run `make` from the root directory of this repository. If you need a specific openshift client tools version, supply the version tag and hash through the env vars `OPENSHIFT_CLIENT_VERSION` and `OPENSHIFT_CLIENT_HASH`, respectively. Release tags and their respective hashes can be found in the [OpenShift origin Github repo](https://github.com/openshift/origin/releases).
