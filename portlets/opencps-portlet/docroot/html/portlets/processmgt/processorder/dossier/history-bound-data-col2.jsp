<%@page import="com.liferay.portal.service.UserLocalServiceUtil"%>
<%@page import="org.opencps.processmgt.model.ActionHistory"%>
<%@page import="com.liferay.portal.kernel.dao.search.ResultRow"%>
<%
/**
 * OpenCPS is the open source Core Public Services software
 * Copyright (C) 2016-present OpenCPS community
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Affero General Public License for more details.
 * You should have received a copy of the GNU Affero General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */
%>

<%@ include file="../../init.jsp"%>

<%
	ResultRow row = (ResultRow) request.getAttribute(WebKeys.SEARCH_CONTAINER_RESULT_ROW);
	ActionHistory actionHistory = (ActionHistory) row.getObject();
	
	String userActionName = StringPool.BLANK;
	try {
		if (Validator.isNotNull(actionHistory.getActionUserId()) || actionHistory.getActionUserId() != 0) {
			userActionName = UserLocalServiceUtil
							.getUser(actionHistory.getActionUserId()).getFullName();
		}
		
	} catch (Exception e ) {
		
	}
	
%>

<div class="ocps-searh-bound-data">
	<p class="ocps-searh-bound-data-chirld-p">
		<span class="ocps-searh-bound-data-chirld-span">
			<liferay-ui:message key="action-user" />
		</span>
		<label class="ocps-searh-bound-data-chirld-label">
			<%=userActionName %>
		</label>
	</p>
	
	<p class="ocps-searh-bound-data-chirld-p">
		<span class="ocps-searh-bound-data-chirld-span">
			<liferay-ui:message key="action-name" />
		</span>
		<label class="ocps-searh-bound-data-chirld-label">
			<%=actionHistory.getActionName() %>
		</label>
	</p>
	
	<p class="ocps-searh-bound-data-chirld-p">
		<span class="ocps-searh-bound-data-chirld-span">
			<liferay-ui:message key="days-delay" />
		</span>
		<label class="ocps-searh-bound-data-chirld-label">
			<%=String.valueOf(actionHistory.getDaysDelay()) %>
		</label>
	</p>
</div>
