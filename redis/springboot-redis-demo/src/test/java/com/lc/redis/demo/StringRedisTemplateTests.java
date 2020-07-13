package com.lc.redis.demo;

import com.lc.redis.demo.entity.UserEntity;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.data.redis.core.StringRedisTemplate;

import java.util.Collection;
import java.util.concurrent.TimeUnit;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;

@SpringBootTest
class StringRedisTemplateTests {

	@Autowired
	private StringRedisTemplate stringRedisTemplate;

	@Test
	void contextLoads() {
		System.out.println("1");

		String value = stringRedisTemplate.opsForValue().get("key");

		assertNull(value);

		stringRedisTemplate.opsForValue().set("key", "1", 10, TimeUnit.MINUTES);

		value = stringRedisTemplate.opsForValue().get("key");

		assertEquals("1", value);
	}

	@Autowired
	private CacheManager cacheManager;

	@Test
	void test() {
		System.out.println(cacheManager.getClass());

		Collection<String> collection = cacheManager.getCacheNames();

		collection.stream().forEach(action -> System.out.println(action));

		Cache cache = cacheManager.getCache("test");

		cacheManager.getCacheNames().stream().forEach(action -> System.out.println(action));

		stringRedisTemplate.opsForValue().set("key", "1", 10, TimeUnit.MINUTES);

		assertNull(cache.get("key"));

		cache.put("cacheKey","2");

		//这里可以得出 cacheManager 的 key 是通过cache name + “::" + key ，value 是通过序列化存redis
		assertEquals("2", cache.get("cacheKey").get());

	}

}
