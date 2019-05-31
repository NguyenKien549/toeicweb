	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!-- pagingation -->
				<div class="col-12 row pagingation"
					style="padding-top: 1em; padding-bottom: 1em">
					<span class="col-md-6 col-sm-12" id="infoPage">Page
						${currentPage} of ${numbPage}</span>
					<ul class="pagination" id="pagin">
						<c:choose>
							<c:when test="${currentPage ==1 }">
								<li class="page-item disabled"><a class="page-link"
									href="${currentPage -1}">Previous</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="${currentPage -1}">Previous</a></li>
							</c:otherwise>
						</c:choose>
						
						<c:forEach  begin= "1" end="${numbPage }" var="count">
							<c:if test="${count == 1 }">
								<c:if test="${count== currentPage}">
									<li class="page-item active"><a class="page-link"
									href="1">1</a></li>
								</c:if>
								<c:if test="${count != currentPage}">
									<li class="page-item"><a class="page-link"
										href="1">1</a></li>
								</c:if>
							</c:if>
							<c:choose>
								<c:when test="${count == currentPage && count >1 && count < numbPage}">
									<c:if test="${(count -1) != 1 }">
										<li class="page-item"><a class="page-link"
											href="${count -1}">${count -1}</a></li>
										</c:if>
									<li class="page-item active"><a class="page-link"
										href="${count}">${count}</a></li>
									<c:if test="${count +1 != numbPage }">
										<li class="page-item"><a class="page-link"
											href="${count +1}">${count +1}</a></li>
										</c:if>
								</c:when>
								<c:otherwise>
									<c:if test="${count == (currentPage-2) && count != 1}">
										<li class="page-item"><a class="page-link"
											href="#">...</a></li>
									</c:if>
									<c:if test="${count == (currentPage+2) && count != numbPage}">
										<li class="page-item"><a class="page-link"
											href="#">...</a></li>
									</c:if>
									
								</c:otherwise>
							
							</c:choose>
					
							<c:if test="${count == numbPage && count !=1 }">
								<c:if test="${count== currentPage}">
									<li class="page-item active"><a class="page-link"
									href="${numbPage }">${numbPage }</a></li>
								</c:if>
								<c:if test="${count != currentPage}">
									<li class="page-item"><a class="page-link"
										href="${numbPage }">${numbPage }</a></li>
								</c:if>
							</c:if>
	
							
						</c:forEach>
						
						<c:choose>
							<c:when test="${currentPage == numbPage }">
								<li class="page-item disabled"><a class="page-link"
									href="${currentPage + 1}">Next</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="${currentPage + 1}">Next</a></li>
							</c:otherwise>
						</c:choose>

					</ul>
				</div>