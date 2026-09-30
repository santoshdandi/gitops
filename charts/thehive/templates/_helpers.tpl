{{- define "thehive.fullname" -}}
{{- default .Chart.Name .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "thehive.selectorLabels" -}}
app.kubernetes.io/name: thehive
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "thehive.labels" -}}
{{ include "thehive.selectorLabels" . }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}
