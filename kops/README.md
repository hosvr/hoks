# hoks/kops

Using kops to manage the kubernetes cluster. 

## Pre-requisites

1. Verify Google SDK Authorization
  * gcloud compute zones list
  * gcloud auth application-default login
2. Set environment variables:
  * KOPS_FEATURE_FLAGS=AlphaAllowGCE
  * KOPS_STATE_STORE=gs://hoks-cluster/


