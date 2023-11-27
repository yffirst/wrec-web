{{- define "service.labels.standard" -}}
app: {{ template "appname" . }}
release: {{ .Release.Name | quote }}
{{- end -}}

{{- define "service.match.labels" -}}
app: {{ template "appname" . }}
release: {{ .Release.Name | quote }}
{{- end -}}

{{- define "fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trimSuffix "-app" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "appname" -}}
{{- $releaseName := default .Release.Name .Values.releaseOverride -}}
{{- printf "%s" $releaseName | trunc 63 | trimSuffix "-" -}}
{{- end -}}
