1. Run terraform apply --var-file=tf.vars
2. Update Helm command below with TF output values to install castai-agent to register cluster to "Read-Only" mode
```helm install castai-agent castai-agent --namespace=castai-agent --set apiKey=<OUTPUT.cluster_token>,additionalEnv.STATIC_CLUSTER_ID=<output.cluster_id>,provider=eks,createNamespace=false --debug```
