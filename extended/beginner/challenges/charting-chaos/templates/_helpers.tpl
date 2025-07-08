{{- define "myapp.name" -}}
charting-chaos
{{- end }}

{{- define "myapp.fullname" -}}
{{ .Release.Name }}
{{- end }}