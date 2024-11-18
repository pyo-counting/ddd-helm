### TYPE
- BUGFIX / ENHANCEMENT / FEATURE / CHANGE

## 1.4.0 / 2024-11-12
- [FEATURE] CronWorkflow: 리소스 추가
    - templates/application/cwf.yaml
- [FEATURE] 전체 리소스 `labels`, `annotataions` 추가

## 1.3.1 / 2024-10-21
- [BUGFIX] Rollout: datadog label에서 common.environment 변수 사용에 따른 오류
    - templates/application/ro.yaml
    - values.yaml

## 1.3.0 / 2024-10-04
- [FEATURE] RoleBinding: 리소스 추가
    - templates/common/rb.yaml
- [FEATURE] Secret: 리소스 추가
    - templates/common/sec.yaml
- [ENHANCEMENT] 전체 리소스 `labelsTemplate`, `anootationsTemplate` 추가 및 변경
- [ENHANCEMENT] helm chart 버전 업데이트에 따른 po 재배포 비활성화
- [CHANGE] values.yaml 구조 변경
    - common.domainCode -> domainCode
    - common.environment -> common.cm.dataTemplate
    - common.timeZone -> common.cm.dataTemplate
    - common.aws.* -> common.sa.annotationsTemplate

## 1.2.0 / 2024-09-09
- [FEATURE] Rollout: init container 추가
    - templates/application/ro.yaml
- [FEATURE] Rollout: emptyDir volumes 추가
    - templates/application/ro.yaml

## 1.1.2 / 2024-09-07
- [ENHANCEMENT] ConfigMap: `.data`, `.binaryData` 필드 Helm template 기능 추가
    - template/application/cm.yaml
    - template/common/cm.yaml

## 1.1.1 / 2024-01-11
- [BUGFIX] Rollout: `1.1.0` 버전 추가 코드 중 if 절 누락으로 인한 추가
    - templates/application/ro.yaml

## 1.1.0 / 2024-01-11
- [ENHANCEMENT] Rollout: 사용자 label(Helm template 지원) 기능 추가
    - templates/application/ro.yaml

## 1.0.6 / 2024-01-10
- [BUGFIX] Rollout: `.spec.replicas` 값을 설정하지 않을 경우 생략돼고 기본 값 1로 설정되는 문제 해결
    - templates/application/ro.yaml

## 1.0.5 / 2023-11-03
- [ENHANCEMENT] Service: AWS LBC 설정 annotation 추가
    - templates/application/svc-nlb.yaml

## 1.0.4 / 2023-09-27
- [BUGFIX] Ingress: 오타 수정
    - templates/application/ing-private.yaml
    - templates/application/ing-public.yaml

## 1.0.3 / 2024-06-29
- [CHANGE] Ingress: 생성 조건 변경
    - templates/application/ing-*.yaml
- [CHANGE] Helm chart 코드 수정
    - templates/application/ing-*.yaml

## 1.0.2 / 2024-06-27
- [BUGFIX] Rollout: 오타 수정
    - templates/application/ro.yaml

## 1.0.1 / 2023-06-22
- [BUGFIX]

## 1.0.0 / 2023-06-09
- [FEATURE] 첫 배포