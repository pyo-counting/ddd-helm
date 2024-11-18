{{/*
cwf(CronWorkflows) parameters
*/}}
{{- define "ddd-helm.cwf.parameters" -}}
parameters:
  {{- range . }}
  - name: {{ .name | quote }}
    {{- if .globalName }}
    globalName: {{ .globalName | quote }}
    {{- end }}    
    {{- if .description }}
    description: {{ .description | quote }}
    {{- end }}
    {{- if or .default (eq .default "") }}
    default: {{ .default | quote }}
    {{- end }}
    {{- if .value }}
    value: {{ .value | quote }}
    {{- end }}
    {{- if .enum }}
    enum:
      {{- toYaml .enum | nindent 8 }}
    {{- end }}
    {{- if .valueFrom}}
    valueFrom:
      {{- if .valueFrom.path }}
      path: {{ .valueFrom.path | quote }}
      {{- end }}
      {{- if or .valueFrom.default (eq .valueFrom.default "") }}
      default: {{ .valueFrom.default | quote }}
      {{- end }}
      {{- if eq .valueFrom.type "configMapKeyRef" }}
      configMapKeyRef:
        key: {{ .valueFrom.configMapKeyRef.key | quote }}
        name: {{ .valueFrom.configMapKeyRef.name | quote }}
        {{- if .valueFrom.configMapKeyRef.optional }}
        optional: {{ .valueFrom.configMapKeyRef.optional }}
        {{- end }}
      {{- else if eq .valueFrom.type "event" }}
      event: {{ .valueFrom.event | quote }}
      {{- else if eq .valueFrom.type "expression" }}
      expression: {{ .valueFrom.expression | quote }}
      {{- else if eq .valueFrom.type "jqFilter" }}
      jqFilter: {{ .valueFrom.jqFilter | quote }}
      {{- else if eq .valueFrom.type "jsonPath" }}
      jsonPath: {{ .valueFrom.jsonPath | quote }}
      {{- else if eq .valueFrom.type "parameter" }}
      parameter: {{ .valueFrom.parameter | quote }}
      {{- else if eq .valueFrom.type "supplied" }}
      supplied: {}
      {{- end }}
    {{- end }}
  {{- end }}
{{- end -}}


{{/*
cwf(CronWorkflows) hooks
*/}}
{{- define "ddd-helm.cwf.hooks" -}}
hooks:
  {{- range . }}
  {{- .name | quote | nindent 2 }}:
    {{- if .expression }}
    expression: {{ .expression | quote }}
    {{- end }}
    {{- if .template }}
    template: {{ .template | quote }}
    {{- end }}
    {{- if .templateRef }}
    templateRef:
      {{- if .templateRef.clusterScope }}
      clusterScope: {{ .templateRef.clusterScope }}
      {{- end }}
      name: {{ .templateRef.name | quote }}
      template: {{ .templateRef.template | quote }}
    {{- end }}
    {{- if .arguments }}
    arguments:
      # artifacts:
      {{- if .arguments.parameters }}
      {{- include "ddd-helm.cwf.parameters" .arguments.parameters | nindent 6 }}
      {{- end }}
    {{- end }}
  {{- end }}
{{- end -}}

{{/*
cwf(CronWorkflows) metrics
*/}}
{{- define "ddd-helm.cwf.metrics" -}}
metrics:
  {{- if .prometheus }}
  prometheus:
    {{- range .prometheus }}
    - name: {{ .name | quote }}
      {{- if .when }}
      when: {{ .when | quote }}
      {{- end }}
      help: {{ .help | quote }}
      {{- if .labels }}
      labels:
        {{- range .labels }}
        - key: {{ .key | quote }}
          value: {{ .value | quote }}
        {{- end }}
      {{- end }}
      {{- if eq .type "counter" }}
      counter:
        value: {{ .counter.value | quote }}
      {{- else if eq .type "gauge" }}
      gauge:
        {{- if .gauge.operation }}
        operation: {{ .gauge.operation | quote }}
        {{- end }}
        {{- if .gauge.realtime }}
        realtime: {{ .gauge.realtime }}
        {{- end }}
        value: {{ .gauge.value | quote }}
      {{- else if eq .type "histogram" }}
      histogram:
        buckets:
          {{- toYaml .histogram.buckets | nindent 14 }}
        value: {{ .histogram.value | quote }}
      {{- end }}
    {{- end }}
  {{- end }}
{{- end -}}

{{/*
cwf(CronWorkflows) retryStrategy
*/}}
{{- define "ddd-helm.cwf.retryStrategy" -}}
retryStrategy:
  {{- if .enabledNodeAntiAffinity }}
  affinity:
    nodeAntiAffinity: {}
  {{- end }}
  {{- if .backoff }}
  backoff:
    {{- if .backoff.duration }}
    duration: {{ .backoff.duration | quote }}
    {{- end }}
    {{- if .backoff.factor }}
    factor: {{ .backoff.factor | quote }}
    {{- end }}
    {{- if .backoff.maxDuration }}
    maxDuration: {{ .backoff.maxDuration | quote }}
    {{- end }}
  {{- end }}
  {{- if .expression }}
  expression: {{ .expression | quote }}
  {{- end }}
  {{- if .limit }}
  limit: {{ .limit | quote }}
  {{- end }}
  {{- if .retryPolicy }}
  retryPolicy: {{ .retryPolicy | quote }}
  {{- end }}
{{- end -}}

{{/*
cwf(CronWorkflows) synchronization
*/}}
{{- define "ddd-helm.cwf.synchronization" -}}
synchronization:
  {{- if .mutexes }}
  mutexes:
    {{- range .mutexes }}
    - name: {{ .name | quote }}
      {{- if .namespace }}
      namespace: {{ .namespace | quote }}
      {{- end }}
    {{- end }}
  {{- end }}
  {{- if .semaphores }}
  semaphores:
    {{- range .semaphores }}
    - configMapKeyRef:
        key: {{ .configMapKeyRef.key | quote }}
        name: {{ .configMapKeyRef.name | quote }}
        {{- if .configMapKeyRef.optional }}
        optional: {{ .configMapKeyRef.optional }}
        {{- end }}
      {{- if .namespace }}
      namespace: {{ .namespace | quote }}
      {{- end }}
    {{- end }}
  {{- end }}
{{- end -}}