package com.lc.cloud.demo.config.anno;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.MethodParameter;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.util.Map;

/**
 * HandlerMethodArgumentResolver 自定义参数解析
 *
 * @author Thinkpad
 */
@Component
public class PostSingleParamHandlerMethodArgumentResolver implements HandlerMethodArgumentResolver {

	@Autowired
	private ObjectMapper objectMapper;

	/**
	 * 只支持当个string
	 * {"key”:"value"}
	 * TODO  考虑一下支持所有基本类型
	 *
	 * @param methodParameter
	 * @return
	 */
	@Override
	public boolean supportsParameter(MethodParameter methodParameter) {
		if (methodParameter.getParameterType().isAssignableFrom(String.class) && methodParameter.hasParameterAnnotation(PostSingleParam.class)) {
			return true;
		}
		return false;
	}

	@Override
	public Object resolveArgument(MethodParameter methodParameter,
								  ModelAndViewContainer modelAndViewContainer,
								  NativeWebRequest nativeWebRequest,
								  WebDataBinderFactory webDataBinderFactory) throws Exception {

		HttpServletRequest request = nativeWebRequest.getNativeRequest(HttpServletRequest.class);
		BufferedReader reader = request.getReader();
		Map<String, String> map = objectMapper.readValue(reader, Map.class);
		PostSingleParam singleParam = methodParameter.getParameterAnnotation(PostSingleParam.class);
		String param = singleParam.value();
		if (!map.containsKey(param)) {
			throw new RuntimeException("no necessary param:" + param);
		}
		String value = map.get(param);

		//验证吧
		if (singleParam.required() && !value.matches(singleParam.checkRule())) {
			throw new RuntimeException(singleParam.checkMsg());
		}
		return value;
	}
}
