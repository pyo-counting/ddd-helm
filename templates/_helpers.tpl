{{/*
namespace
*/}}
{{- define "ddd-helm.namespace" -}}
{{- .Values.domainCode }}-ns
{{- end -}}

{{/*
component label
*/}}
{{- define "ddd-helm.componentLabel" -}}
{{- if .name -}}
app.kubernetes.io/component: {{ .name }}
{{- end -}}
{{- end -}}

{{/*
common labels
*/}}
{{- define "ddd-helm.commonLabels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
# app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: {{ .Chart.Name }}
{{- end -}}