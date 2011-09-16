require 'java'

class CacheFactory

  include org.infinispan.Cache
  include org.infinispan.config.Configuration
  include org.infinispan.loaders.file.FileCacheStore
  include org.infinispan.loaders.file.DefaultCacheManager

  def initialize
    @config = Configuration.new
    @store  = FileCacheStore.new

    # Configure the cache
    @store.purge_on_startup false
    @config.fluent.loaders.add_cache_loader( @store ).indexing.index_local_only( true ).add_property( 'indexing', 'in memory' )
    
    # Create the cache and return it
    @manager = DefaultCacheManager.new( @config.build )
  end

  def get_cache
    @manager.get_cache
  end

end



