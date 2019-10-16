package com.lc.cloud.demo.repository.dao.user;

import com.lc.cloud.demo.repository.entity.user.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

@Mapper
@Component
public interface UserDao {

    /**
     * 根据名字查user对象
     *
     * @param userName
     * @return
     */
    User findByUserName(String userName);
}
