## Prerequisites
- EKS 1.24
- Helm 3.8.0+

---
## Get Chart Info
``` bash
# login helm registry
aws ecr get-login-password --region ap-northeast-2 | helm registry login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.ap-northeast-2.amazonaws.com
# print helm chart info
helm show chart oci://${AWS_ACCOUNT_ID}.dkr.ecr.ap-northeast-2.amazonaws.com/ddd-helm
```
See [helm show chart](https://helm.sh/docs/helm/helm_show_chart/) for command documentation.

---
## Install Chart
``` bash
# AWS ECR login
aws ecr get-login-password --region ap-northeast-2 | helm registry login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.ap-northeast-2.amazonaws.com
# intsall helm
helm install ${RELEASE_NAME} oci://${AWS_ACCOUNT_ID}.dkr.ecr.ap-northeast-2.amazonaws.com/ddd-helm
```
See [configuration](#configuration) below.

See [helm install](https://helm.sh/docs/helm/helm_install/) for command documentation.

---
## Dependencies
| Name                         | Version |
|------------------------------|---------|
| aws-load-balancer-controller | 1.6.2   |
| secrets-store-csi-driver     | 1.3.3   |
| secrets-provider-aws         | 0.3.2   |
| aws-efs-csi-driver           | 2.4.1   |
| argo-rollouts                | 2.30.0  |
| metrics-server               | 3.10.0  |
| datadog                      | 3.20.3  |
| argo-workflows               | 0.42.5  |

---
## Uninstall Chart
``` bash
helm uninstall ${RELEASE_NAME}
```
This removes all the Kubernetes components associated with the chart and deletes the release.

See [helm uninstall](https://helm.sh/docs/helm/helm_uninstall/) for command documentation.

---
## Updating values.schema.json
- 

---
## Upgrading Chart
``` bash
# login helm registry
aws ecr get-login-password --region ap-northeast-2 | helm registry login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.ap-northeast-2.amazonaws.com
# upgrade release with latest helm chart
helm upgrade --install ${RELEASE_NAME} oci://${AWS_ACCOUNT_ID}.dkr.ecr.ap-northeast-2.amazonaws.com/ddd-helm
```
See [helm upgrade](https://helm.sh/docs/helm/helm_upgrade/) for command documentation.

---
## Configuration
See [Customizing the Chart Before Installing](https://helm.sh/docs/intro/using_helm/#customizing-the-chart-before-installing). To see all configurable options with detailed comments, visit the chart's values.yaml, or run these configuration commands:
``` bash
aws ecr get-login-password --region ap-northeast-2 | helm registry login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.ap-northeast-2.amazonaws.com
# print helm chart values info
helm show values oci://${AWS_ACCOUNT_ID}.dkr.ecr.ap-northeast-2.amazonaws.com/ddd-helm
```

---
## Roadmap
- 버그
    - Helm if 문에서 숫자 값 0일 때도 false인데, 이를 고려해서 개발되었는지 확인 필요(1.0.6 버전에서 해당 부분 일부 수정)
- Service
    - .spec.type이 NodePort인 AWS nlb
    - Headless .spec.type이 ExternalName, NodePort
    - AWS nlb 대상 node affinity
    - AWS NLB에 security group attach 가능함에 따라 기능 추가 필요
- Ingress
    - AWS alb 대상 authentication
    - AWS alb 대상 node affinity
- TargetGroupBinding
    - 기능 추가
- PersistentVolume, PersistentVolumeClaim, StorageClass
    - dynamic provisioning
    - snapshot, cloning, populator, cross namespace volume data sources
    - `.csi.volumeHandle`를 통해 efs의 access point를 설정 가능하도록
- Rollout
    - AWS alb traffic routing을 이용한 canary
    - node affinity
    - Pod 내 여러 container
    - Pod 내 sidecar, ephemeral contaier
    - experiment, analysis
- ConfigMap
    - container 내 파일 마운트
    - .immutable이 true 지원
        - ture일 경우 ArgoCD에서 아래 오류 지속 발생
        ```
        ConfigMap "****" is invalid: binaryData: Forbidden: field is immutable when `immutable` is set
        ```
    - 업데이트에 따른 po의 재시작 기능
        - https://helm.sh/docs/howto/charts_tips_and_tricks/#automatically-roll-deployments
- CronWorkflow
    - tempalte 타입 구현: containerSet, resource, data, http, script, steps, plugin