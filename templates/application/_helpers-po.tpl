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

{{/*
po(Pod) nodeSelector
*/}}
{{- define "ddd-helm.po.nodeSelector" -}}
nodeSelector:
  {{- toYaml . | nindent 2 }}
{{- end -}}

{{/*
po(Pod) affinity
*/}}
{{- define "ddd-helm.po.affinity" -}}
affinity:
  {{- if .nodeAffinity }}
  nodeAffinity:
    {{- if .nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution }}
    preferredDuringSchedulingIgnoredDuringExecution:
      {{- range .nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution }}
      - weight: {{ .weight }}
        preference:
          {{- if .preference.matchExpressions }}
          matchExpressions:
            {{- toYaml .preference.matchExpressions | nindent 12 }}
          {{- end }}
          {{- if .preference.matchFields }}
          matchFields:
            {{- toYaml .preference.matchFields | nindent 12 }}
          {{- end }}
      {{- end }}
    {{- end }}
    {{- if .nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution }}
    requiredDuringSchedulingIgnoredDuringExecution:
      nodeSelectorTerms:
        {{- range .nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms }}
        {{- if .matchExpressions }}
        - matchExpressions:
          {{- toYaml .matchExpressions | nindent 10 }}
        {{- end }}
        {{- if .matchFields }}
        - matchFields:
          {{- toYaml .matchFields | nindent 10 }}
        {{- end }}
        {{- end }}
    {{- end }}
  {{- end }}
  {{- if .podAffinity }}
  podAffinity:
    {{- if .podAffinity.preferredDuringSchedulingIgnoredDuringExecution }}
    preferredDuringSchedulingIgnoredDuringExecution:
      {{- range .podAffinity.preferredDuringSchedulingIgnoredDuringExecution }}
      - weight: {{ .weight }}
        podAffinityTerm:
          topologyKey: {{ .podAffinityTerm.topologyKey | quote }}
          {{- if .podAffinityTerm.labelSelector }}
          labelSelector:
            {{- if .podAffinityTerm.labelSelector.matchExpressions }}
            matchExpressions:
              {{- toYaml .podAffinityTerm.labelSelector.matchExpressions | nindent 14 }}
            {{- end }}
            {{- if .podAffinityTerm.labelSelector.matchLabels }}
            matchLabels:
              {{- toYaml .podAffinityTerm.labelSelector.matchLabels | nindent 14 }}
            {{- end }}
          {{- end }}
          {{- if .podAffinityTerm.matchLabelKeys }}
          matchLabelKeys:
            {{- toYaml .podAffinityTerm.matchLabelKeys | nindent 12 }}
          {{- end }}
          {{- if .podAffinityTerm.mismatchLabelKeys }}
          mismatchLabelKeys:
            {{- toYaml .podAffinityTerm.mismatchLabelKeys | nindent 12 }}
          {{- end }}
          {{- if .podAffinityTerm.namespaceSelector }}
          namespaceSelector:
            {{- if .podAffinityTerm.namespaceSelector.matchExpressions }}
            matchExpressions:
              {{- toYaml .podAffinityTerm.namespaceSelector.matchExpressions | nindent 14 }}
            {{- end }}
            {{- if .podAffinityTerm.namespaceSelector.matchLabels }}
            matchLabels:
              {{- toYaml .podAffinityTerm.namespaceSelector.matchLabels | nindent 14 }}
            {{- end }}
          {{- end }}
          {{- if .podAffinityTerm.namespaces }}
          namespaces:
            {{- toYaml .podAffinityTerm.namespaces | nindent 12 }}
          {{- end }}
      {{- end }}
    {{- end }}
    {{- if .podAffinity.requiredDuringSchedulingIgnoredDuringExecution }}
    requiredDuringSchedulingIgnoredDuringExecution:
      {{- range .podAffinity.requiredDuringSchedulingIgnoredDuringExecution }}
      - topologyKey: {{ .topologyKey | quote }}
        labelSelector:
          {{- if .labelSelector.matchExpressions }}
          matchExpressions:
            {{- toYaml .labelSelector.matchExpressions | nindent 12 }}
          {{- end }}
          {{- if .labelSelector.matchLabels }}
          matchLabels:
            {{- toYaml .labelSelector.matchLabels | nindent 12 }}
          {{- end }}
        {{- if .matchLabelKeys }}
        matchLabelKeys:
          {{- toYaml .matchLabelKeys | nindent 10 }}
        {{- end }}
        {{- if .mismatchLabelKeys }}
        mismatchLabelKeys:
          {{- toYaml .mismatchLabelKeys | nindent 10 }}
        {{- end }}
        {{- if .namespaceSelector }}
        namespaceSelector:
          {{- if .namespaceSelector.matchExpressions }}
          matchExpressions:
            {{- toYaml .namespaceSelector.matchExpressions | nindent 12 }}
          {{- end }}
          {{- if .namespaceSelector.matchLabels }}
          matchLabels:
            {{- toYaml .namespaceSelector.matchLabels | nindent 12 }}
          {{- end }}
        {{- end }}
        {{- if .namespaces }}
        namespaces:
          {{- toYaml .namespaces | nindent 10 }}
        {{- end }}
      {{- end }}
    {{- end }}
  {{- end }}
  {{- if .podAntiAffinity }}
  podAntiAffinity:
    {{- if .podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution }}
    preferredDuringSchedulingIgnoredDuringExecution:
      {{- range .podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution }}
      - weight: {{ .weight }}
        podAffinityTerm:
          topologyKey: {{ .podAffinityTerm.topologyKey | quote }}
          {{- if .podAffinityTerm.labelSelector }}
          labelSelector:
            {{- if .podAffinityTerm.labelSelector.matchExpressions }}
            matchExpressions:
              {{- toYaml .podAffinityTerm.labelSelector.matchExpressions | nindent 14 }}
            {{- end }}
            {{- if .podAffinityTerm.labelSelector.matchLabels }}
            matchLabels:
              {{- toYaml .podAffinityTerm.labelSelector.matchLabels | nindent 14 }}
            {{- end }}
          {{- end }}
          {{- if .podAffinityTerm.matchLabelKeys }}
          matchLabelKeys:
            {{- toYaml .podAffinityTerm.matchLabelKeys | nindent 12 }}
          {{- end }}
          {{- if .podAffinityTerm.mismatchLabelKeys }}
          mismatchLabelKeys:
            {{- toYaml .podAffinityTerm.mismatchLabelKeys | nindent 12 }}
          {{- end }}
          {{- if .podAffinityTerm.namespaceSelector }}
          namespaceSelector:
            {{- if .podAffinityTerm.namespaceSelector.matchExpressions }}
            matchExpressions:
              {{- toYaml .podAffinityTerm.namespaceSelector.matchExpressions | nindent 14 }}
            {{- end }}
            {{- if .podAffinityTerm.namespaceSelector.matchLabels }}
            matchLabels:
              {{- toYaml .podAffinityTerm.namespaceSelector.matchLabels | nindent 14 }}
            {{- end }}
          {{- end }}
          {{- if .podAffinityTerm.namespaces }}
          namespaces:
            {{- toYaml .podAffinityTerm.namespaces | nindent 12 }}
          {{- end }}
      {{- end }}
    {{- end }}
    {{- if .podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution }}
    requiredDuringSchedulingIgnoredDuringExecution:
      {{- range .podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution }}
      - topologyKey: {{ .topologyKey | quote }}
        labelSelector:
          {{- if .labelSelector.matchExpressions }}
          matchExpressions:
            {{- toYaml .labelSelector.matchExpressions | nindent 12 }}
          {{- end }}
          {{- if .labelSelector.matchLabels }}
          matchLabels:
            {{- toYaml .labelSelector.matchLabels | nindent 12 }}
          {{- end }}
        {{- if .matchLabelKeys }}
        matchLabelKeys:
          {{- toYaml .matchLabelKeys | nindent 10 }}
        {{- end }}
        {{- if .mismatchLabelKeys }}
        mismatchLabelKeys:
          {{- toYaml .mismatchLabelKeys | nindent 10 }}
        {{- end }}
        {{- if .namespaceSelector }}
        namespaceSelector:
          {{- if .namespaceSelector.matchExpressions }}
          matchExpressions:
            {{- toYaml .namespaceSelector.matchExpressions | nindent 12 }}
          {{- end }}
          {{- if .namespaceSelector.matchLabels }}
          matchLabels:
            {{- toYaml .namespaceSelector.matchLabels | nindent 12 }}
          {{- end }}
        {{- end }}
        {{- if .namespaces }}
        namespaces:
          {{- toYaml .namespaces | nindent 10 }}
        {{- end }}
      {{- end }}
    {{- end }}
  {{- end }}
{{- end -}}

{{/*
po(Pod) tolerations
*/}}
{{- define "ddd-helm.po.tolerations" -}}
tolerations:
  {{- toYaml . | nindent 2 }}
{{- end -}}

{{/*
po(Pod) priorityClassName
*/}}
{{- define "ddd-helm.po.priorityClassName" -}}
priorityClassName: {{ . | quote }}
{{- end -}}

{{/*
po(Pod) topologySpreadConstraints
*/}}
{{- define "ddd-helm.po.topologySpreadConstraints" -}}
{{- with .topologySpreadConstraints }}
topologySpreadConstraints:
  {{- range . }}
  - maxSkew: {{ .maxSkew }}
    topologyKey: {{ .topologyKey | quote }}
    whenUnsatisfiable: {{ .whenUnsatisfiable | quote }}
    labelSelector:
      {{- if . | dig "labelSelector" "matchExpressions" false }}
      matchExpressions:
        {{- toYaml .labelSelector.matchExpressions | nindent 8 }}
      {{- end }}
      matchLabels:
        {{- include "ddd-helm.componentLabel" $ | nindent 8 }}
        {{- if . | dig "labelSelector" "matchLabels" false }}
        {{- toYaml .labelSelector.matchLabels | nindent 8 }}
        {{- end }}
    {{- if .matchLabelKeys }}
    matchLabelKeys:
      {{- toYaml .matchLabelKeys | nindent 6 }}
    {{- end}}
    {{- if .minDomains }}
    minDomains: {{ .minDomains }}
    {{- end }}
    {{- if .nodeAffinityPolicy }}
    nodeAffinityPolicy: {{ .nodeAffinityPolicy | quote }}
    {{- end }}
    {{- if .nodeTaintsPolicy}}
    nodeTaintsPolicy: {{ .nodeTaintsPolicy | quote }}
    {{- end }}
  {{- end }}
{{- end }}
{{- end -}}