package cn.libra.user.bean;

import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Component;

import java.io.Serializable;


@Component
public class User implements Serializable {
    private String id;
    private String name;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public User() {
    }

    public User(String id, String userName) {
        this.id = id;
        this.name = userName;
    }

    public JSONObject toJson(){
        JSONObject json = new JSONObject();
        json.put("id",this.id);
        json.put("name",this.name);
        return json;
    }
}
