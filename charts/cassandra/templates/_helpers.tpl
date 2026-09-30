{{- define "cassandra.fullname" -}}
{{- default .Chart.Name .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "cassandra.selectorLabels" -}}
app.kubernetes.io/name: cassandra
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "cassandra.labels" -}}
{{ include "cassandra.selectorLabels" . }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{- define "cassandra.seeds" -}}
{{- $fn := include "cassandra.fullname" . -}}
{{- printf "%s-0.%s-headless.%s.svc.cluster.local" $fn $fn .Release.Namespace -}}
{{- end -}}
