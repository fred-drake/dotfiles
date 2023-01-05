# Encrypt a file with AGE
agee() {
  age -e -o "$2 " -i ~/.age/personal-key.txt -r age1ffag60kk9es84dk2yg7ppax6ygmg7a34hpve86d8w8l40k4fj3tq2zqxjg "$1"
}

kresources() {
  NAMESPACE=$1
  kubectl api-resources --verbs=list --namespaced -o name | xargs -n 1 kubectl get --show-kind --ignore-not-found -n $NAMESPACE
  ( \
    kubectl proxy & kubectl get namespace $NAMESPACE -o json | \
    jq '.spec = {"finalizers":[]}' >temp.json curl -k -H "Content-Type: application/json" -X PUT \
    --data-binary @temp.json 127.0.0.1:8001/api/v1/namespaces/$NAMESPACE/finalize \
  )
}

rstc() {
  if [ -z "${AWS_ACCESS_KEY_ID}" ]; then
    echo "AWS_ACCESS_KEY_ID not defined!"
  elif [ -z "${AWS_SECRET_ACCESS_KEY}" ]; then
    echo "AWS_SECRET_ACCESS_KEY not defined!"
  elif [ -z "${RESTIC_PASSWORD}" ]; then
    echo "RESTIC_PASSWORD not defined!"
  elif [ -z "${RESTIC_REPOSITORY}" ]; then
    echo "RESTIC_REPOSITORY not defined!"
  else
    restic --password-command "echo ${RESTIC_PASSWORD}" -r ${RESTIC_REPOSITORY}/$1 ${@:2}
  fi
}

rstc_k8s() {
  if [[ -z "${AWS_ACCESS_KEY_ID}" ]]; then
    echo "AWS_ACCESS_KEY_ID not defined!"
  elif [[ -z "${AWS_SECRET_ACCESS_KEY}" ]]; then
    echo "AWS_SECRET_ACCESS_KEY not defined!"
  elif [[ -z "${RESTIC_PASSWORD}" ]]; then
    echo "RESTIC_PASSWORD not defined!"
  else
    restic --password-command "echo ${RESTIC_PASSWORD}" -r s3:https://minio-backup.internal.freddrake.com/$1 ${@:2}
  fi
}
