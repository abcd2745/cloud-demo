package com.lc.redis.demo.config;

import com.lc.redis.demo.entity.UserEntity;
import org.springframework.cache.CacheManager;
import org.springframework.cache.concurrent.ConcurrentMapCacheManager;
import org.springframework.cache.support.CompositeCacheManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.cache.RedisCacheWriter;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializer;

import java.util.Arrays;


@Configuration
public class RedisConfig {

	/**
	 * 在设置反序列化时，已经传递了Class，则只能序列化这个类型
	 *
	 * @param redisConnectionFactory
	 * @return
	 */
	@Bean(name = "redisTemplate")
	public RedisTemplate<String, UserEntity> redisTemplate(RedisConnectionFactory redisConnectionFactory) {
		RedisTemplate<String, UserEntity> template = new RedisTemplate<>();
		template.setConnectionFactory(redisConnectionFactory);

		RedisSerializer<UserEntity> serializer = new Jackson2JsonRedisSerializer<>(UserEntity.class);
		template.setValueSerializer(serializer);
		template.setHashValueSerializer(serializer);

		template.setKeySerializer(RedisSerializer.string());
		template.setHashKeySerializer(RedisSerializer.string());

		template.setConnectionFactory(redisConnectionFactory);

		return template;
	}

	/**
	 * TODO  改理解下 CacheManager  有什么作用  ，CompositeCacheManager 怎么才能实现组合缓存
	 * 本地缓存用 store-by-references (高效)
	 * spring-data-redis 2.x 之后，RedisCacheManager 不再需要RedisTemplate （变化巨大）
	 *
	 * @return
	 */
	@Bean
	public CacheManager cacheManager(RedisConnectionFactory redisConnectionFactory) {
		CompositeCacheManager compositeCacheManager = new CompositeCacheManager();

		ConcurrentMapCacheManager concurrentMapCacheManager = new ConcurrentMapCacheManager();

		RedisCacheWriter redisCacheWriter = RedisCacheWriter.nonLockingRedisCacheWriter(redisConnectionFactory);
		RedisCacheManager redisCacheManager = RedisCacheManager.builder().cacheWriter(redisCacheWriter).build();

		compositeCacheManager.setCacheManagers(Arrays.asList(concurrentMapCacheManager, redisCacheManager));

		return compositeCacheManager;
	}

//	@Bean
//		// 关联redis到注解
//	RedisCacheManager redisCacheManager(RedisConnectionFactory redisConnectionFactory) {
//
//		RedisCacheWriter redisCacheWriter = RedisCacheWriter.nonLockingRedisCacheWriter(redisConnectionFactory);
//
//		// 默认配置，过期时间指定是30分钟
//		RedisCacheConfiguration defaultCacheConfig = RedisCacheConfiguration.defaultCacheConfig();
//		defaultCacheConfig.entryTtl(Duration.ofMinutes(30));
//
//		// redisExpire1h cache配置，过期时间指定是1小时，缓存key的前缀指定成prefixaaa_（存到redis的key会自动添加这个前缀）
//		RedisCacheConfiguration userCacheConfiguration = RedisCacheConfiguration.defaultCacheConfig().
//				entryTtl(Duration.ofHours(1)).prefixCacheNameWith("prefixaaa_");
//		Map<String, RedisCacheConfiguration> redisCacheConfigurationMap = new HashMap<>();
//		redisCacheConfigurationMap.put("redisExpire1h", userCacheConfiguration);
//
//		RedisCacheManager cacheManager = new RedisCacheManager(redisCacheWriter, defaultCacheConfig, redisCacheConfigurationMap);
//		return cacheManager;
//	}


}
