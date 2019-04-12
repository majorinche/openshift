package com.sgst.controller;

import com.sgst.domain.User;
import com.sgst.mapper.UserMapper;
import com.sgst.utils.R;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserMapper userMapper;

    @PostMapping("save")
    @ApiOperation(tags = {"mysql"}, value = "添加用户")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "username", value = "昵称", required = true, paramType = "query"),
            @ApiImplicitParam(name = "name", value = "姓名", required = true, paramType = "query"),
            @ApiImplicitParam(name = "mobile", value = "手机号", required = true, paramType = "query")
    })
    R saveUser(String username, String name, String mobile) {
        User user = new User(username, name, mobile);
        userMapper.insert(user);
        return R.ok();
    }

    @GetMapping("list")
    @ApiOperation(tags = {"mysql"}, value = "查看所有用户")
    List<User> list() {
        return userMapper.selectAll();
    }


    @GetMapping("get")
    @ApiOperation(tags = {"mysql"}, value = "查看指定用户")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "主键", required = true, paramType = "query", dataType = "int"),
    })
    User get(Integer id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @PutMapping("update")
    @ApiOperation(tags = {"mysql"}, value = "更改用户")
    R update(User user) {
        if (userMapper.updateByPrimaryKey(user) == 1) {
            return R.ok();
        }
        return R.error();
    }

    @DeleteMapping("remove")
    @ApiOperation(tags = {"mysql"}, value = "查看指定用户")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "主键", required = true, paramType = "query", dataType = "int"),
    })
    R remove(Integer id) {
        if (userMapper.deleteByPrimaryKey(id) == 1) {
            return R.ok();
        }
        return R.error();
    }

}
