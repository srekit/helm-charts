{{- define "general.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else }}
{{- $name | trunc 63 | trimSuffix "-" -}}
{{- end }}
{{- end }}


{{- define "general.labels" -}}
app.kubernetes.io/name: {{ include "general.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name | trunc 63 | trimSuffix "-" }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
{{- end }}


{{- define "general.namespace" }}
{{- .Release.Namespace | trunc 63 | trimSuffix "-" -}}
{{- end }}


{{- define "image" -}}
{{- $tag := default .Chart.AppVersion .Values.image.tag -}}
{{- printf "%s/%s:%s" .Values.image.repository .Values.image.name $tag -}}
{{- end }}


{{- define "serviceAccount.name" -}}
{{- if .Values.serviceAccount.name -}}
{{- .Values.serviceAccount.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- include "general.fullname" . -}}
{{- end -}}
{{- end }}
