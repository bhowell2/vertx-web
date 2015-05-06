require 'vertx-apex/routing_context'
require 'vertx/util/utils.rb'
# Generated from io.vertx.ext.apex.Route
module VertxApex
  #  A route is a holder for a set of criteria which determine whether an HTTP request or failure should be routed
  #  to a handler.
  class Route
    # @private
    # @param j_del [::VertxApex::Route] the java delegate
    def initialize(j_del)
      @j_del = j_del
    end
    # @private
    # @return [::VertxApex::Route] the underlying java delegate
    def j_del
      @j_del
    end
    #  Add an HTTP method for this route. By default a route will match all HTTP methods. If any are specified then the route
    #  will only match any of the specified methods
    # @param [:OPTIONS,:GET,:HEAD,:POST,:PUT,:DELETE,:TRACE,:CONNECT,:PATCH] method the HTTP method to add
    # @return [self]
    def method(method=nil)
      if method.class == Symbol && !block_given?
        @j_del.java_method(:method, [Java::IoVertxCoreHttp::HttpMethod.java_class]).call(Java::IoVertxCoreHttp::HttpMethod.valueOf(method))
        return self
      end
      raise ArgumentError, "Invalid arguments when calling method(method)"
    end
    #  Set the path prefix for this route. If set then this route will only match request URI paths which start with this
    #  path prefix. Only a single path or path regex can be set for a route.
    # @param [String] path the path prefix
    # @return [self]
    def path(path=nil)
      if path.class == String && !block_given?
        @j_del.java_method(:path, [Java::java.lang.String.java_class]).call(path)
        return self
      end
      raise ArgumentError, "Invalid arguments when calling path(path)"
    end
    #  Set the path prefix as a regular expression. If set then this route will only match request URI paths, the beginning
    #  of which match the regex. Only a single path or path regex can be set for a route.
    # @param [String] path the path regex
    # @return [self]
    def path_regex(path=nil)
      if path.class == String && !block_given?
        @j_del.java_method(:pathRegex, [Java::java.lang.String.java_class]).call(path)
        return self
      end
      raise ArgumentError, "Invalid arguments when calling path_regex(path)"
    end
    #  Add a content type produced by this route. Used for content based routing.
    # @param [String] contentType the content type
    # @return [::VertxApex::Route] a reference to this, so the API can be used fluently
    def produces(contentType=nil)
      if contentType.class == String && !block_given?
        return ::VertxApex::Route.new(@j_del.java_method(:produces, [Java::java.lang.String.java_class]).call(contentType))
      end
      raise ArgumentError, "Invalid arguments when calling produces(contentType)"
    end
    #  Add a content type consumed by this route. Used for content based routing.
    # @param [String] contentType the content type
    # @return [self]
    def consumes(contentType=nil)
      if contentType.class == String && !block_given?
        @j_del.java_method(:consumes, [Java::java.lang.String.java_class]).call(contentType)
        return self
      end
      raise ArgumentError, "Invalid arguments when calling consumes(contentType)"
    end
    #  Specify the order for this route. The router tests routes in that order.
    # @param [Fixnum] order the order
    # @return [self]
    def order(order=nil)
      if order.class == Fixnum && !block_given?
        @j_del.java_method(:order, [Java::int.java_class]).call(order)
        return self
      end
      raise ArgumentError, "Invalid arguments when calling order(order)"
    end
    #  Specify whether this is the last route for the router.
    # @param [true,false] last true if last
    # @return [self]
    def last(last=nil)
      if (last.class == TrueClass || last.class == FalseClass) && !block_given?
        @j_del.java_method(:last, [Java::boolean.java_class]).call(last)
        return self
      end
      raise ArgumentError, "Invalid arguments when calling last(last)"
    end
    #  Specify a request handler for the route. The router routes requests to handlers depending on whether the various
    #  criteria such as method, path, etc match. There can be only one request handler for a route. If you set this more
    #  than once it will overwrite the previous handler.
    # @yield the request handler
    # @return [self]
    def handler
      if block_given?
        @j_del.java_method(:handler, [Java::IoVertxCore::Handler.java_class]).call((Proc.new { |event| yield(::VertxApex::RoutingContext.new(event)) }))
        return self
      end
      raise ArgumentError, "Invalid arguments when calling handler()"
    end
    #  Specify a blocking request handler for the route. 
    #  This method works just like {::VertxApex::Route#handler} excepted that it will run the blocking handler on a different thread
    #  so that it won't block the event loop. Note that it's safe to call context.next() from the 
    #  blocking handler as it will be executed on the event loop context (and not on the worker thread)
    # @yield the blocking request handler
    # @return [self]
    def blocking_handler
      if block_given?
        @j_del.java_method(:blockingHandler, [Java::IoVertxCore::Handler.java_class]).call((Proc.new { |event| yield(::VertxApex::RoutingContext.new(event)) }))
        return self
      end
      raise ArgumentError, "Invalid arguments when calling blocking_handler()"
    end
    #  Specify a failure handler for the route. The router routes failures to failurehandlers depending on whether the various
    #  criteria such as method, path, etc match. There can be only one failure handler for a route. If you set this more
    #  than once it will overwrite the previous handler.
    # @yield the request handler
    # @return [self]
    def failure_handler
      if block_given?
        @j_del.java_method(:failureHandler, [Java::IoVertxCore::Handler.java_class]).call((Proc.new { |event| yield(::VertxApex::RoutingContext.new(event)) }))
        return self
      end
      raise ArgumentError, "Invalid arguments when calling failure_handler()"
    end
    #  Remove this route from the router
    # @return [self]
    def remove
      if !block_given?
        @j_del.java_method(:remove, []).call()
        return self
      end
      raise ArgumentError, "Invalid arguments when calling remove()"
    end
    #  Disable this route. While disabled the router will not route any requests or failures to it.
    # @return [self]
    def disable
      if !block_given?
        @j_del.java_method(:disable, []).call()
        return self
      end
      raise ArgumentError, "Invalid arguments when calling disable()"
    end
    #  Enable this route.
    # @return [self]
    def enable
      if !block_given?
        @j_del.java_method(:enable, []).call()
        return self
      end
      raise ArgumentError, "Invalid arguments when calling enable()"
    end
    #  If true then the normalised request path will be used when routing (e.g. removing duplicate /)
    #  Default is true
    # @param [true,false] useNormalisedPath use normalised path for routing?
    # @return [self]
    def use_normalised_path(useNormalisedPath=nil)
      if (useNormalisedPath.class == TrueClass || useNormalisedPath.class == FalseClass) && !block_given?
        @j_del.java_method(:useNormalisedPath, [Java::boolean.java_class]).call(useNormalisedPath)
        return self
      end
      raise ArgumentError, "Invalid arguments when calling use_normalised_path(useNormalisedPath)"
    end
    #  @return the path prefix (if any) for this route
    # @return [String]
    def get_path
      if !block_given?
        return @j_del.java_method(:getPath, []).call()
      end
      raise ArgumentError, "Invalid arguments when calling get_path()"
    end
  end
end