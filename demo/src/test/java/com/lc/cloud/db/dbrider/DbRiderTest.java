package com.lc.cloud.db.dbrider;

import com.github.database.rider.core.api.dataset.DataSet;
import com.lc.cloud.demo.repository.dao.user.UserDao;
import com.lc.cloud.demo.repository.entity.user.User;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.mock;

public class DbRiderTest extends DbRiderSuperTest{

    @Autowired
    private UserDao userDao;

    @Ignore
    @Test
    @DataSet("/config/datasets/users.yml")
    public void shouldListUsers() throws Exception {
        assertThat(userDao).isNotNull();
        User user = mock(User.class);
        user.setUserName("dbunit");
        assertThat(userDao.findByUserName("dbunit")).isEqualTo(user);
    }
}
