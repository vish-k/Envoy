# There's a sidecar for that! #

When developing Cloud Native distributed applications, we often end up with diverse set of microservices. (If you don't,
I'd recommend re-considering 😉 ). I'm strong proponent of _choosing the right tool for the job._ So obviously, we may end up with different platforms, languages etc.

We need lot of common functionality for these microservices e.g. Authn/Authz, observability (logging, metrics, open tracing), circuit breakers, retries. How do we optimize different microservices teams and prevent reinvention of wheel? One option is to maintain SDKs but it's not really scalable/manageable option for diverse and dynamic tech stack. 

This is where **sidecar pattern** comes to the rescue. In this pattern, microservice outsources these common tasks to an attached component called Sidecar (called so because it's similar to sidecar attached to motorcycle). Unlike edge proxies, that may perform some similar functions, sidecar's lifecycle is tied to the microservice container.

Lyft's engineering team played major role in evangelizing sidecar pattern, when they open sourced Envoy proxy. Envoy has fuelled Lyft's migration from monolith to microservices and helped create amazing platform. More details at https://www.envoyproxy.io .

With Envoy's success some other proxies have remodelled themselves as sidecar, Envoy really is the defacto sidecar. It has huge community support and service meshes like istio and AWS app mesh are build around envoy.

This repo intends to share some tips and tricks related to Envoy.

1. Running Envoy with ssl cert created at bootstrap. (./envoy-ssl)
