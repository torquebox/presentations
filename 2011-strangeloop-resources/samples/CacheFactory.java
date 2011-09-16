import org.infinispan.Cache;
import org.infinispan.config.Configuration;
import org.infinispan.loaders.file.FileCacheStore;
import org.infinispan.loaders.file.DefaultCacheManager;


public class CacheFactory {

  private Configuration config;
  private FileCacheStoreConfig store;
  private DefaultCacheManager manager;

  public CacheFactory() {
    config = new Configuration();
    store  = new FileCacheStoreConfig();
    
    // Configure the cache
    store.purgeOnStartup( false );
    config.fluent().loaders.addCacheLoader( store ).indexing().indexLocalOnly( true ).addProperty("indexing", "in memory");

    // Create the cache and return it
    manager = new DefaultCacheManager( config.build() );
  }

  public Cache getCache() {
    return manager.getCache();
  }
}
