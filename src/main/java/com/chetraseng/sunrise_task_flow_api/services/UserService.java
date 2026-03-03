package com.chetraseng.sunrise_task_flow_api.services;

import com.chetraseng.sunrise_task_flow_api.dto.UserInfoDto;
import java.util.List;

public interface UserService {
  List<UserInfoDto> getAllUsers();
}
