package com.lc.redis.demo;

import com.lc.redis.demo.entity.UserEntity;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;

import java.util.concurrent.TimeUnit;

@SpringBootTest
public class RedisTemplateTest {

	@Autowired
	private RedisTemplate<String, UserEntity> redisTemplate;

	@Test
	void test() {
		UserEntity u = new UserEntity();
		u.setUsername("张三");
		u.setPassword("mima");
		redisTemplate.opsForValue().set("userKey", u, 1, TimeUnit.MINUTES);

		UserEntity u2 = redisTemplate.opsForValue().get("userKey");
		Assertions.assertEquals(u, u2);
	}
}
