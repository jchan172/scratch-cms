# Applications created before Rails 4.1 uses Marshal to serialize cookie values into
# the signed and encrypted cookie jars. To use the new JSON-based format, we can set
# the cookies serializer this way to transparently migrate the existing Marshal-seriaziled
# cookies into the new JSON-based format.
ScratchCms::Application.config.action_dispatch.cookies_serializer :hybrid