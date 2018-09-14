package cn.libra.server.bean;

import com.alibaba.fastjson.JSONObject;

public class SCourse {
    private String id;

    private String cname;

    private String tid;
    public JSONObject toJson(){
        JSONObject json=new JSONObject();
        json.put("id",this.id);
        json.put("cname",this.cname);
        json.put("tid",this.tid);
        return  json;
    }
    public SCourse(String id, String cname, String tid) {
        this.id = id;
        this.cname = cname;
        this.tid = tid;
    }

    public SCourse() {
        super();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname == null ? null : cname.trim();
    }

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid == null ? null : tid.trim();
    }
}