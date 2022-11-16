<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- top.jsp -->
<%@include file="../common/top.jsp"%>

<!-- 상단 -->
<div class="card">
	<div class="card-body">
		<div class="d-flex gap-1 mb-4 flex-wrap">
			<div class="d-flex gap-1 me-auto flex-wrap">
				<button
					class="btn btn-primary d-inline-flex align-items-center gap-1"
					data-bs-toggle="modal" data-bs-target="#addOrderSheetModal">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
						fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd"
							d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
							clip-rule="evenodd" />
                  </svg>
					수주서 추가
				</button>
				
				<button class="btn btn-light d-inline-flex align-items-center gap-1">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
						fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd"
							d="M3 17a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM6.293 6.707a1 1 0 010-1.414l3-3a1 1 0 011.414 0l3 3a1 1 0 01-1.414 1.414L11 5.414V13a1 1 0 11-2 0V5.414L7.707 6.707a1 1 0 01-1.414 0z"
							clip-rule="evenodd" />
                  </svg>
					Export
				</button>
				<div class="dropdown">
					<button
						class="btn btn-light d-inline-flex align-items-center gap-1 dropdown-toggle no-caret"
						type="button" data-bs-toggle="dropdown"
						data-bs-auto-close="outside" aria-expanded="false">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
							fill="currentColor" aria-hidden="true">
                      <path fill-rule="evenodd"
								d="M3 3a1 1 0 011-1h12a1 1 0 011 1v3a1 1 0 01-.293.707L12 11.414V15a1 1 0 01-.293.707l-2 2A1 1 0 018 17v-5.586L3.293 6.707A1 1 0 013 6V3z"
								clip-rule="evenodd" />
                    </svg>
						Filter
					</button>
					<form class="dropdown-menu p-3" style="min-width: 250px">
						<h6 class="dropdown-header p-0">Filter options</h6>
						<hr>
						<div class="vstack gap-3">
							<div>
								<label class="form-label">Role:</label> <select
									class="dselect form-select" data-dselect-clearable="true">
									<option value="">Choose role</option>
									<option value="administrator">Administrator</option>
									<option value="analyst">Analyst</option>
									<option value="developer">Developer</option>
									<option value="support">Support</option>
									<option value="trial">Trial</option>
								</select>
							</div>
							<div>
								<label class="form-label">Two Step Verification:</label> <select
									class="dselect form-select" data-dselect-clearable="true">
									<option value="">Select option</option>
									<option value="enabled">Enabled</option>
									<option value="disabled">Disabled</option>
								</select>
							</div>
							<button class="btn btn-primary" type="button">Apply</button>
						</div>
					</form>
				</div>
			</div>
			<form>
				<input type="text" class="form-control" placeholder="Search user">
			</form>
		</div>
		<div class="table-responsive my-1">
			<table class="table align-middle">
				<thead>
					<tr>
						<th scope="col">
							<div>
								<input class="form-check-input" type="checkbox" value="">
							</div>
						</th>
						<th scope="col">User</th>
						<th scope="col">Role</th>
						<th scope="col">Last login</th>
						<th scope="col" nowrap>Two-step</th>
						<th scope="col">Joined date</th>
						<th scope="col">Actions</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<div>
								<input class="form-check-input" type="checkbox" value="">
							</div>
						</td>
						<td>
							<div class="d-flex align-items-center gap-3">
								<img src="/resources/assets/img/user/user1.svg" alt=""
									width="42" height="42" class="rounded-circle" loading="lazy">
								<div class="d-flex flex-column">
									<h6>Cody Fisher</h6>
									<small class="text-secondary">cody.fisher@example.com</small>
								</div>
							</div>
						</td>
						<td>Administrator</td>
						<td><span class="badge bg-light text-muted">Yesterday</span></td>
						<td></td>
						<td nowrap>10 Mar 2021</td>
						<td>
							<div class="btn-group btn-group-sm" role="group">
								<button type="button" class="btn btn-light d-flex">
									<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
										fill="none" viewBox="0 0 24 24" stroke="currentColor"
										aria-hidden="true">
                            <path stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                          </svg>
								</button>
								<button type="button" class="btn btn-light d-flex text-danger">
									<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
										fill="none" viewBox="0 0 24 24" stroke="currentColor"
										aria-hidden="true">
                            <path stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                          </svg>
								</button>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div>
								<input class="form-check-input" type="checkbox" value="">
							</div>
						</td>
						<td>
							<div class="d-flex align-items-center gap-3">
								<img src="/resources/assets/img/user/user2.svg" alt=""
									width="42" height="42" class="rounded-circle" loading="lazy">
								<div class="d-flex flex-column">
									<h6>Esther Howard</h6>
									<small class="text-secondary">esther.howard@example.com</small>
								</div>
							</div>
						</td>
						<td>Analyst</td>
						<td><span class="badge bg-light text-muted">20 mins
								ago</span></td>
						<td><span class="badge bg-success">Enabled</span></td>
						<td nowrap>22 Aug 2021</td>
						<td>
							<div class="btn-group btn-group-sm" role="group">
								<button type="button" class="btn btn-light d-flex">
									<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
										fill="none" viewBox="0 0 24 24" stroke="currentColor"
										aria-hidden="true">
                            <path stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                          </svg>
								</button>
								<button type="button" class="btn btn-light d-flex text-danger">
									<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
										fill="none" viewBox="0 0 24 24" stroke="currentColor"
										aria-hidden="true">
                            <path stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                          </svg>
								</button>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div>
								<input class="form-check-input" type="checkbox" value="">
							</div>
						</td>
						<td>
							<div class="d-flex align-items-center gap-3">
								<img src="/resources/assets/img/user/user3.svg" alt=""
									width="42" height="42" class="rounded-circle" loading="lazy">
								<div class="d-flex flex-column">
									<h6>Cameron Williamson</h6>
									<small class="text-secondary">cameron.williamson@example.com</small>
								</div>
							</div>
						</td>
						<td>Developer</td>
						<td><span class="badge bg-light text-muted">3 days ago</span></td>
						<td></td>
						<td nowrap>05 May 2021</td>
						<td>
							<div class="btn-group btn-group-sm" role="group">
								<button type="button" class="btn btn-light d-flex">
									<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
										fill="none" viewBox="0 0 24 24" stroke="currentColor"
										aria-hidden="true">
                            <path stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                          </svg>
								</button>
								<button type="button" class="btn btn-light d-flex text-danger">
									<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
										fill="none" viewBox="0 0 24 24" stroke="currentColor"
										aria-hidden="true">
                            <path stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                          </svg>
								</button>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div>
								<input class="form-check-input" type="checkbox" value="">
							</div>
						</td>
						<td>
							<div class="d-flex align-items-center gap-3">
								<img src="/resources/assets/img/user/user4.svg" alt=""
									width="42" height="42" class="rounded-circle" loading="lazy">
								<div class="d-flex flex-column">
									<h6>Bernard Lane</h6>
									<small class="text-secondary">bernard.lane@example.com</small>
								</div>
							</div>
						</td>
						<td>Support</td>
						<td><span class="badge bg-light text-muted">5 hours
								ago</span></td>
						<td><span class="badge bg-success">Enabled</span></td>
						<td nowrap>21 Feb 2021</td>
						<td>
							<div class="btn-group btn-group-sm" role="group">
								<button type="button" class="btn btn-light d-flex">
									<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
										fill="none" viewBox="0 0 24 24" stroke="currentColor"
										aria-hidden="true">
                            <path stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                          </svg>
								</button>
								<button type="button" class="btn btn-light d-flex text-danger">
									<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
										fill="none" viewBox="0 0 24 24" stroke="currentColor"
										aria-hidden="true">
                            <path stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                          </svg>
								</button>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div>
								<input class="form-check-input" type="checkbox" value="">
							</div>
						</td>
						<td>
							<div class="d-flex align-items-center gap-3">
								<img src="/resources/assets/img/user/user5.svg" alt=""
									width="42" height="42" class="rounded-circle" loading="lazy">
								<div class="d-flex flex-column">
									<h6>Dan Wilson</h6>
									<small class="text-secondary">dan.wilson@example.com</small>
								</div>
							</div>
						</td>
						<td>Developer</td>
						<td><span class="badge bg-light text-muted">3 days ago</span></td>
						<td><span class="badge bg-success">Enabled</span></td>
						<td nowrap>10 Jul 2021</td>
						<td>
							<div class="btn-group btn-group-sm" role="group">
								<button type="button" class="btn btn-light d-flex">
									<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
										fill="none" viewBox="0 0 24 24" stroke="currentColor"
										aria-hidden="true">
                            <path stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                          </svg>
								</button>
								<button type="button" class="btn btn-light d-flex text-danger">
									<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
										fill="none" viewBox="0 0 24 24" stroke="currentColor"
										aria-hidden="true">
                            <path stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                          </svg>
								</button>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<nav aria-label="Page navigation borderless example">
			<ul class="pagination pagination-borderless justify-content-end">
				<li class="page-item disabled"><a
					class="page-link d-flex align-items-center px-2" href="#"
					tabindex="-1" aria-disabled="true" aria-label="Previous"> <svg
							width="20" height="20" xmlns="http://www.w3.org/2000/svg"
							viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd"
								d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z"
								clip-rule="evenodd"></path>
                    </svg>
				</a></li>
				<li class="page-item active" aria-current="page"><a
					class="page-link" href="javascript:void(0)">1</a></li>
				<li class="page-item"><a class="page-link"
					href="javascript:void(0)">2</a></li>
				<li class="page-item"><a class="page-link"
					href="javascript:void(0)">3</a></li>
				<li class="page-item"><a
					class="page-link d-flex align-items-center px-2"
					href="javascript:void(0)" aria-label="Next"> <svg width="20"
							height="20" xmlns="http://www.w3.org/2000/svg"
							viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd"
								d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
								clip-rule="evenodd"></path>
                    </svg>
				</a></li>
			</ul>
		</nav>
	</div>
</div>

<br>

<!-- 하단 -->
<div class="card">
	<div class="card-body">
		<div class="d-flex gap-1 mb-4 flex-wrap">
			<div class="d-flex gap-1 me-auto flex-wrap">
				<button
					class="btn btn-primary d-inline-flex align-items-center gap-1"
					data-bs-toggle="modal" data-bs-target="#addUserModal">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
						fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd"
							d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
							clip-rule="evenodd" />
                  </svg>
					품목 추가
				</button>
			</div>
		</div>
		<div class="table-responsive my-1">
			<table class="table align-middle">
				<thead>
					<tr>
						<th scope="col">
							<div>
								<input class="form-check-input" type="checkbox" value="">
							</div>
						</th>
						<th scope="col">User</th>
						<th scope="col">Role</th>
						<th scope="col">Last login</th>
						<th scope="col" nowrap>Two-step</th>
						<th scope="col">Joined date</th>
						<th scope="col">Actions</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<div>
								<input class="form-check-input" type="checkbox" value="">
							</div>
						</td>
						<td>
							<div class="d-flex align-items-center gap-3">
								<img src="/resources/assets/img/user/user1.svg" alt=""
									width="42" height="42" class="rounded-circle" loading="lazy">
								<div class="d-flex flex-column">
									<h6>Cody Fisher</h6>
									<small class="text-secondary">cody.fisher@example.com</small>
								</div>
							</div>
						</td>
						<td>Administrator</td>
						<td><span class="badge bg-light text-muted">Yesterday</span></td>
						<td></td>
						<td nowrap>10 Mar 2021</td>
						<td>
							<div class="btn-group btn-group-sm" role="group">
								<button type="button" class="btn btn-light d-flex">
									<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
										fill="none" viewBox="0 0 24 24" stroke="currentColor"
										aria-hidden="true">
                            <path stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                          </svg>
								</button>
								<button type="button" class="btn btn-light d-flex text-danger">
									<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
										fill="none" viewBox="0 0 24 24" stroke="currentColor"
										aria-hidden="true">
                            <path stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                          </svg>
								</button>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div>
								<input class="form-check-input" type="checkbox" value="">
							</div>
						</td>
						<td>
							<div class="d-flex align-items-center gap-3">
								<img src="/resources/assets/img/user/user2.svg" alt=""
									width="42" height="42" class="rounded-circle" loading="lazy">
								<div class="d-flex flex-column">
									<h6>Esther Howard</h6>
									<small class="text-secondary">esther.howard@example.com</small>
								</div>
							</div>
						</td>
						<td>Analyst</td>
						<td><span class="badge bg-light text-muted">20 mins
								ago</span></td>
						<td><span class="badge bg-success">Enabled</span></td>
						<td nowrap>22 Aug 2021</td>
						<td>
							<div class="btn-group btn-group-sm" role="group">
								<button type="button" class="btn btn-light d-flex">
									<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
										fill="none" viewBox="0 0 24 24" stroke="currentColor"
										aria-hidden="true">
                            <path stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                          </svg>
								</button>
								<button type="button" class="btn btn-light d-flex text-danger">
									<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
										fill="none" viewBox="0 0 24 24" stroke="currentColor"
										aria-hidden="true">
                            <path stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                          </svg>
								</button>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div>
								<input class="form-check-input" type="checkbox" value="">
							</div>
						</td>
						<td>
							<div class="d-flex align-items-center gap-3">
								<img src="/resources/assets/img/user/user3.svg" alt=""
									width="42" height="42" class="rounded-circle" loading="lazy">
								<div class="d-flex flex-column">
									<h6>Cameron Williamson</h6>
									<small class="text-secondary">cameron.williamson@example.com</small>
								</div>
							</div>
						</td>
						<td>Developer</td>
						<td><span class="badge bg-light text-muted">3 days ago</span></td>
						<td></td>
						<td nowrap>05 May 2021</td>
						<td>
							<div class="btn-group btn-group-sm" role="group">
								<button type="button" class="btn btn-light d-flex">
									<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
										fill="none" viewBox="0 0 24 24" stroke="currentColor"
										aria-hidden="true">
                            <path stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                          </svg>
								</button>
								<button type="button" class="btn btn-light d-flex text-danger">
									<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
										fill="none" viewBox="0 0 24 24" stroke="currentColor"
										aria-hidden="true">
                            <path stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                          </svg>
								</button>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div>
								<input class="form-check-input" type="checkbox" value="">
							</div>
						</td>
						<td>
							<div class="d-flex align-items-center gap-3">
								<img src="/resources/assets/img/user/user4.svg" alt=""
									width="42" height="42" class="rounded-circle" loading="lazy">
								<div class="d-flex flex-column">
									<h6>Bernard Lane</h6>
									<small class="text-secondary">bernard.lane@example.com</small>
								</div>
							</div>
						</td>
						<td>Support</td>
						<td><span class="badge bg-light text-muted">5 hours
								ago</span></td>
						<td><span class="badge bg-success">Enabled</span></td>
						<td nowrap>21 Feb 2021</td>
						<td>
							<div class="btn-group btn-group-sm" role="group">
								<button type="button" class="btn btn-light d-flex">
									<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
										fill="none" viewBox="0 0 24 24" stroke="currentColor"
										aria-hidden="true">
                            <path stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                          </svg>
								</button>
								<button type="button" class="btn btn-light d-flex text-danger">
									<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
										fill="none" viewBox="0 0 24 24" stroke="currentColor"
										aria-hidden="true">
                            <path stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                          </svg>
								</button>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div>
								<input class="form-check-input" type="checkbox" value="">
							</div>
						</td>
						<td>
							<div class="d-flex align-items-center gap-3">
								<img src="/resources/assets/img/user/user5.svg" alt=""
									width="42" height="42" class="rounded-circle" loading="lazy">
								<div class="d-flex flex-column">
									<h6>Dan Wilson</h6>
									<small class="text-secondary">dan.wilson@example.com</small>
								</div>
							</div>
						</td>
						<td>Developer</td>
						<td><span class="badge bg-light text-muted">3 days ago</span></td>
						<td><span class="badge bg-success">Enabled</span></td>
						<td nowrap>10 Jul 2021</td>
						<td>
							<div class="btn-group btn-group-sm" role="group">
								<button type="button" class="btn btn-light d-flex">
									<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
										fill="none" viewBox="0 0 24 24" stroke="currentColor"
										aria-hidden="true">
                            <path stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                          </svg>
								</button>
								<button type="button" class="btn btn-light d-flex text-danger">
									<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
										fill="none" viewBox="0 0 24 24" stroke="currentColor"
										aria-hidden="true">
                            <path stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                          </svg>
								</button>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

<!-- Modal 코드 넣을 위치 -->
<div class="modal fade" id="addOrderSheetModal" tabindex="-1">
	<div class="modal-dialog modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header border-0">
				<h5 id="modal-title">수주서 등록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<!-- form start -->
				<form class="needs-validation" novalidate id="modalForm" action="" method="post">
					
					<!-- 
					<div class="mb-3">
						<label for="userFullname" class="form-label">담당자</label>
						<div class="row">
							<div class="col">
								<input type="text" id="member_name" class="form-control" readonly>
								<input type="hidden" name="member_no" class="form-control" readonly>
							</div>
							<div class="col">
								<button type="button" class="btn btn-primary" data-bs-target="#choiceMemberModal" data-bs-toggle="modal" data-bs-dismiss="modal" id="choiceMemberBtn">담당자 선택</button>
							</div>
						</div>
					</div> 
					-->
					
					<div class="row">		
						<div class="col-sm-3">		
							<label for="userFullname" class="form-label">코드</label>
							<input type="text" id="member_code" class="form-control" readonly>
						</div>
						<div class="col-sm-5">		
							<label for="userFullname" class="form-label">담당자명</label>
							<input type="text" id="member_name" class="form-control" readonly>
							<input type="hidden" name="member_no" class="form-control" readonly>
						</div>
						<div class="col-sm-4">	
							<label for="userFullname" class="form-label">&nbsp;&nbsp;</label>
							<button type="button" class="btn btn-primary" style="display:block" data-bs-target="#choiceClientModal" data-bs-toggle="modal" data-bs-dismiss="modal" id="choiceMembertBtn">담당자 선택</button>	
						</div>
					</div>
					
					<div class="row">		
						<div class="col-sm-3">		
							<label for="userFullname" class="form-label">코드</label>
							<input type="text" id="client_code" class="form-control" readonly>
						</div>
						<div class="col-sm-5">		
							<label for="userFullname" class="form-label">거래처명</label>
							<input type="text" id="client_name" class="form-control" readonly>
							<input type="hidden" name="client_no" class="form-control" readonly>
						</div>
						<div class="col-sm-4">	
							<label for="userFullname" class="form-label">&nbsp;&nbsp;</label>
							<button type="button" class="btn btn-primary" style="display:block" data-bs-target="#choiceClientModal" data-bs-toggle="modal" data-bs-dismiss="modal" id="choiceClientBtn">거래처 선택</button>	
						</div>
					</div>		
					<!-- 
					<div class="mb-3">
						<label for="userFullname" class="form-label">거래처</label>
						<div class="row">
							<div class="col">
								<input type="text" id="client_name" class="form-control" readonly>
								<input type="hidden" name="client_no" class="form-control" readonly>
							</div>
							<div class="col">
								<button type="button" class="btn btn-primary" data-bs-target="#choiceClientModal" data-bs-toggle="modal" data-bs-dismiss="modal" id="choiceClientBtn">거래처 선택</button>
							</div>
						</div>
					</div> 
					-->
					
					<div class="mb-3">
						<label for="userFullname" class="form-label">납기일자</label>
						<div class="row">
							<div class="col">
								<input type="date" name="out_day">
							</div>
						</div>
					</div>
					
					<div class="mb-3">
						<label for="userEmail" class="form-label">품목명</label> 
						<input type="text" name="name" id="name" class="form-control" required>
						<div class="invalid-feedback">User email is required.</div>
					</div>
					
				</form>
				<!-- form end -->
			</div>
			<div class="modal-footer border-0">
				<button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
				<button type="button" id="modalRegisterBtn"class="btn btn-primary px-5">등록</button>		
			</div>
		</div>
	</div>
</div>

<!-- 거래처를 선택하는 두번째 모달 -->
<div class="modal fade" id="choiceClientModal" tabindex="-2">
	<div class="modal-dialog modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header border-0">
				<h5 id="modal-title">거래처 입력</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body" style="padding-bottom:0px">
						<div class="modal-footer border-0">
							<form style="margin:auto;text-align:center;" onsubmit="return false;">
								<div class="d-flex gap-1 me-auto flex-wrap">
									<!-- <input type="text" class="form-control" placeholder="Search Client"> -->
									<%
						                String[] search = {"code","name","owner"};
						                String[] cate = {"거래처코드","거래처명","대표자명"};
					                %>
		                  			<c:set value="<%=search %>" var="s"></c:set>
		                  			<c:set value="<%=cate %>" var="c"></c:set>
									
										<select id="clientWhatColumn" class="form-select" style="width: 140px;">
							                <option value="" selected>검색 선택</option>
							                <c:forEach begin="0" end="2" var="i">
							                <option value="${s[i] }"<c:if test="${searchvo.whatColumn== s[i] }">selected</c:if>>${c[i] }</option>
							                </c:forEach>
						              	</select>
						              	<input type="text" id="clientKeyword" class="form-control" value=<c:if test="${searchvo.keyword=='null' }"></c:if><c:if test="${searchvo.keyword!='null' }">"${searchvo.keyword }"</c:if>  placeholder="입력" style="width: 200px; height: 38px;">
										<button type="submit" class="btn btn-light" id="searchClientBtn"> 검색 </button>
								</div>			
							</form>	
						</div>
						<div class="table-responsive my-1">
							<table class="table align-middle">
								<thead>
									<tr>
										<th scope="col"></th>
										<th scope="col">거래처코드</th>
										<th scope="col">거래처명</th>
										<th scope="col">대표자명</th>
									</tr>
								</thead>
								<tbody id="clientSelectTbody">
									<!-- 클라이언트 레코드들이 javascript 코드에 의해 그려지는 위치 -->
								</tbody>
							</table>
						</div>
						
						<!-- 페이지내이션 -->
						<nav aria-label="Page navigation borderless example">
							<ul class="pagination pagination-borderless justify-content-end" id="clientPageNation">
								<!-- 페이지내이션이 javascript 코드에 의해 그려지는 위치 -->
							</ul>
						</nav>
						
					</div>
				
			<div class="modal-footer border-0">
				<button type="button" class="btn btn-light" data-bs-target="#addOrderSheetModal" data-bs-toggle="modal" data-bs-dismiss="modal">돌아가기</button>
				<button class="btn btn-primary" data-bs-target="#addOrderSheetModal" data-bs-toggle="modal" data-bs-dismiss="modal" id="delivery_data">확인</button>
			</div>
		</div>
	</div>
</div>


<!-- bottom.jsp -->
<%@include file="../common/bottom.jsp"%>

<script type="text/javascript">
	/* 왼쪽 카테고리창이 해당화면에 맞게 펼쳐지게 하는 코드 */
	$(function(){ 
		document.getElementById('basicinfo').click();
	});
</script>


<!-- 거래처를 선택하는 두번째 모달처리 -->
<script type="text/javascript">
	var subject = ""; // member or client 이 값은 두번째 모달로 넘어가는 버튼에 의해 변경된다. 
	var pageNum = 1;
	var amount = 10;
	var clientWhatColumn = "";
	var clientKeyword = "";

	/* 두번째 모달에서 첫번째 모달로 데이터를 옮기는 코드 */
	$("#delivery_data").on("click", function(e){
		var clientNo = $('input[name=clientRadio]:checked').parent().next().text();
		var clientCode = $('input[name=clientRadio]:checked').parent().next().next().text();
		var clientName = $('input[name=clientRadio]:checked').parent().next().next().next().text();
		
		$("input[name='client_no']").val(clientNo);
		$("#client_code").val(clientCode);
		$("#client_name").val(clientName);
	});
	
	
	/* 첫번째 모달에서 거래처 선택이 눌렸을 때 이동한 두번째 모달창에서 데이터를 요청하고 관련 화면을 그리는 부분 */
	$("#choiceClientBtn").on("click", function(e){
		/*** 여기서 선택박스 초기화 하는거 해줘야함 ***/
		$("#clientKeyword").val("");
		clientWhatColumn = "";
		clientKeyword = "";
		
		requestClientRecord();
	});
	
	/* ajax로 거래처정보를 요청하는 부분 + 화면전환없이 레코드들을 그리는 부분 + 화면전환없이 페이지네이션을 그리는 부분 */
	function requestClientRecord(){
		console.log("요청url" + "/basicinfo/client/pages/"+ pageNum +"/" + amount + "/" + clientWhatColumn + "/" + clientKeyword)
		$.getJSON("/basicinfo/client/pages/"+ pageNum +"/" + amount + "/" + clientWhatColumn + "/" + clientKeyword,  
 			function(resdata){
				console.log("list: " + resdata.list); 	  			// 1페이지 레코드들이 담긴 객체
 				console.log("totalCount: " + resdata.totalCount); 	// 검색조건으로 뽑힌 총 레코드 수
 				console.log("cri: " + resdata.cri); 	  			// 검색에 사용된 기준정보가 담긴 객체
 				
 				paintClientRecord(resdata.list); 			// 레코드들을 그리는 함수
 				paintClientPageNation(resdata.totalCount, resdata.cri); 	// 페이지네이션을 그리는 함수
 				
 			}).fail(function(xhr, status, err){
 					alert("거래처 조회실패");
 			});	
	}
	
	/* 거래처 선택 모달의 거래처 레코드들을 그리는 함수 */
	function paintClientRecord(list){

			var str = "";
			
			for(var i = 0, len = list.length || 0; i < len; i++){
				str += "<tr>";
				str += "<td><input class='form-check-input' type='radio' name='clientRadio' value=" + list[i].name + "></td>";
				str += "<td style='display:none'>" + list[i].no +"</td>";
				str += "<td>" + list[i].code +"</td>";
				str += "<td>" + list[i].name +"</td>";
				str += "<td>" + list[i].owner +"</td>";
				str += "</tr>";
			}
			
			if(list.length == 0){
				str = "<tr><td colspan='5' style='text-align:center'>검색결과가 없습니다</td></tr>";
			}
			
			$("#clientSelectTbody").html(str);
	}
	
	/* 거래처 선택 모달의 페이지네이션을 그리는 함수 */
	function paintClientPageNation(totalCount, cri){
		
		var str = ""; 
		
		var pageCount = 5; // 한번에 보여줄 페이지번호 개수 
		
		//pageNum에 따른 cri.amount 단위의 시작페이지, 끝페이지를 구함
		var endPageNum = Math.ceil(pageNum / pageCount) * pageCount;// javascript 에서 pageNum / cri.amount 결과는 그냥 0.1 
		var startPageNum = endPageNum - (pageCount-1);
		var lastPageNum = Math.ceil(totalCount / cri.amount	);
		
		var isNeedFirst = pageNum > 5;
		var isNeedPrev = (startPageNum != 1);
		var isNeedNext = false;
		var isNeedEnd = true; 
		
		//5단위의 endPageNum을 그대로 사용하면 안되는 경우 endPageNum을 다시구함 
		if(lastPageNum <= endPageNum){
			endPageNum = lastPageNum;
			isNeedEnd = false;
		}
		
		
		if(endPageNum < lastPageNum){
			isNeedNext = true;
		}
		
		// str을 만듬.
		str += "<ul class='pagination pull-right'>";
		
		if(isNeedFirst){
			str += "<li class='page-item'><a class='page-link d-flex align-items-center px-2' href='" + 1 +"'>";
			str += "<svg width='20' height='20' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 20 20' fill='currentColor'>";
			str += "<path xmlns='http://www.w3.org/2000/svg' id='svg_1' clip-rule='evenodd' d='m9.49241,5.293a1,1 0 0 1 0,1.414l-3.293,3.293l3.293,3.293a1,1 0 0 1 -1.414,1.414l-4,-4a1,1 0 0 1 0,-1.414l4,-4a1,1 0 0 1 1.414,0z' fill-rule='evenodd'/>";
			str += "<path xmlns='http://www.w3.org/2000/svg' id='svg_2' clip-rule='evenodd' d='m15.48719,5.37988a1,1 0 0 1 0,1.414l-3.293,3.293l3.293,3.293a1,1 0 0 1 -1.414,1.414l-4,-4a1,1 0 0 1 0,-1.414l4,-4a1,1 0 0 1 1.414,0z' fill-rule='evenodd'/>";
			str += "</svg>";
			str += "</a></li>";
		}
		
		//이전 버튼 출력여부에 따라 버튼 표시
		if(isNeedPrev){
			str += "<li class='page-item'><a class='page-link d-flex align-items-center px-2' href='" + (startPageNum-1) +"'>";
			str += "<svg width='20' height='20' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 20 20' fill='currentColor'>";
			str += "<path fill-rule='evenodd' d='M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z' clip-rule='evenodd'></path>";
			str += "</svg>";
			str += "</a></li>"; 
		}
		
		//가운데 숫자 출력
		for(var i = startPageNum; i <= endPageNum; i++){
			var active = (pageNum == i ? "active" : "");
			str += "<li class='page-item " + active +"'>" + "<a class='page-link' href='"+ i +"'>" + i + "</a></li>";
		}
		
		//다음 버튼 출력여부에 따라 버튼 표시
		if(isNeedNext){
			str += "<li class='page-item'><a class='page-link d-flex align-items-center px-2' href='" + (endPageNum + 1) +"'>";
			str += "<svg width='20' height='20' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 20 20' fill='currentColor'>";
			str += "<path fill-rule='evenodd' d='M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z' clip-rule='evenodd'></path>";
			str += "</svg>";
			str += "</a></li>";
		}
		
		if(isNeedEnd){
			str += "<li class='page-item'><a class='page-link d-flex align-items-center px-2' href='" + lastPageNum +"'>";
			str += "<svg width='20' height='20' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 20 20' fill='currentColor'>";
			str += "<path id='svg_1' clip-rule='evenodd' d='m4.29467,14.707a1,1 0 0 1 0,-1.414l3.293,-3.293l-3.293,-3.293a1,1 0 0 1 1.414,-1.414l4,4a1,1 0 0 1 0,1.414l-4,4a1,1 0 0 1 -1.414,0z' fill-rule='evenodd'/>";
			str += "<path id='svg_2' clip-rule='evenodd' d='m10.68001,14.87357a1,1 0 0 1 0,-1.414l3.293,-3.293l-3.293,-3.293a1,1 0 0 1 1.414,-1.414l4,4a1,1 0 0 1 0,1.414l-4,4a1,1 0 0 1 -1.414,0z' fill-rule='evenodd'/>";
			str += "</svg>";
			str += "</a></li>";
		}
		
		str += "</ul></div>";
		
		$("#clientPageNation").html(str);
	}
	
	/* 거래처 선택 모달의 페이지네이션에서 번호 클릭시 다시 그리는 함수 */
	$("#clientPageNation").on("click", "li a", function(e){
		e.preventDefault(); // 번호를 눌러도 페이지가 이동하지 않도록 a태그 기능 무력화
		pageNum = $(this).attr("href");
		
		requestClientRecord();
	});
	
	/* 거래처 선택 모달에서 사용자가 검색을 시도할 때 이를 처리하는 부분*/
	$("#searchClientBtn").on("click", function(e){
		clientWhatColumn = $("#clientWhatColumn").val();
		clientKeyword = $("#clientKeyword").val();
		console.log("clientWhatColumn: " + clientWhatColumn);
		console.log("clientKeyword: " + clientKeyword);
		
		if(clientWhatColumn == ""){
			alert("검색 조건을 선택하세요");
			return;
		}
	
		requestClientRecord();
	});
</script>