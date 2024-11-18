{{/*
po(Pod) securityContext
*/}}
{{- define "ddd-helm.po.securityContext" -}}
securityContext:
  runAsNonRoot: true
  runAsUser: {{ .runAsUser }}
  runAsGroup: {{ .runAsGroup }}
  {{- if .supplementalGroups }}
  supplementalGroups:
    {{- toYaml .supplementalGroups | nindent 4 }}
  {{- end }}
  {{- if .fsGroup }}
  fsGroup: {{ .fsGroup }}
  {{- end }}
  {{- if .fsGroupChangePolicy }}
  fsGroupChangePolicy: {{ .fsGroupChangePolicy | quote }}
  {{- end }}
{{- end -}}