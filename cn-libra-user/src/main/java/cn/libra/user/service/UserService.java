package cn.libra.user.service;



import cn.libra.utils.util.redis.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("user_userService")
@Transactional(readOnly = true)
public class UserService {
}
