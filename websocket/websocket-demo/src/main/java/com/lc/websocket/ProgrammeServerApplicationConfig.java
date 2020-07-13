package com.lc.websocket;

import javax.websocket.Endpoint;
import javax.websocket.server.ServerApplicationConfig;
import javax.websocket.server.ServerEndpointConfig;
import java.util.HashSet;
import java.util.Set;

/**
 * @author Thinkpad
 */
public class ProgrammeServerApplicationConfig implements ServerApplicationConfig {

	@Override
	public Set<ServerEndpointConfig> getEndpointConfigs(Set<Class<? extends Endpoint>> endpointClasses) {

		Set<ServerEndpointConfig> configs = new HashSet<>();
		ServerEndpointConfig sec = ServerEndpointConfig.Builder.create(ProgrammeWebSocket.class,"/programme").build();
		configs.add(sec);
		return configs;
	}

	@Override
	public Set<Class<?>> getAnnotatedEndpointClasses(Set<Class<?>> scanned) {
		return scanned;
	}
}
