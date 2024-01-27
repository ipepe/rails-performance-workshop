require 'jaeger/client'
OpenTracing.global_tracer = Jaeger::Client.build(host: 'jaeger', port: 6831, service_name: 'echo')
