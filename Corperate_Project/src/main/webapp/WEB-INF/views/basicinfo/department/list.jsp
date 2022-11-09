<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- top.jsp -->
<%@include file="../../common/top.jsp" %>

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
					Add user
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
								<img src="/resource/assets/img/user/user1.svg" alt="" width="42"
									height="42" class="rounded-circle" loading="lazy">
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
								<img src="/resource/assets/img/user/user2.svg" alt="" width="42"
									height="42" class="rounded-circle" loading="lazy">
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
								<img src="/resource/assets/img/user/user3.svg" alt="" width="42"
									height="42" class="rounded-circle" loading="lazy">
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
								<img src="/resource/assets/img/user/user4.svg" alt="" width="42"
									height="42" class="rounded-circle" loading="lazy">
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
								<img src="/resource/assets/img/user/user5.svg" alt="" width="42"
									height="42" class="rounded-circle" loading="lazy">
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

<!-- Modal 코드 넣을 위치 -->
<!-- Add user modal -->
<div class="modal fade" id="addUserModal" tabindex="-1">
	<div class="modal-dialog modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header border-0">
				<h5 class="modal-title">Add user</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form class="needs-validation" novalidate id="taskForm">
					<div class="mb-3">
						<label for="userFullname" class="form-label">Full name</label> <input
							type="text" name="userFullname" class="form-control"
							id="userFullname" required autofocus>
						<div class="invalid-feedback">User full name is required.</div>
					</div>
					<div class="mb-3">
						<label for="userEmail" class="form-label">Email</label> <input
							type="email" name="userEmail" class="form-control" id="userEmail"
							required>
						<div class="invalid-feedback">User email is required.</div>
					</div>
					<div class="mb-3 vstack gap-3">
						<label for="userRole" class="form-label">Role</label>
						<div class="form-check">
							<input type="radio" class="form-check-input flex-shrink-0"
								id="role1" name="radio" required> <label
								class="form-check-label" for="role1">
								<h6 class="mb-1">Administrator</h6>
								<p class="mb-0 text-secondary small">Best for business
									owners and company administrators</p>
							</label>
						</div>
						<div class="form-check">
							<input type="radio" class="form-check-input flex-shrink-0"
								id="role2" name="radio" required> <label
								class="form-check-label" for="role2">
								<h6 class="mb-1">Developer</h6>
								<p class="mb-0 text-secondary small">Best for developers or
									people primarily using the API</p>
							</label>
						</div>
						<div class="form-check">
							<input type="radio" class="form-check-input flex-shrink-0"
								id="role3" name="radio" required> <label
								class="form-check-label" for="role3">
								<h6 class="mb-1">Analyst</h6>
								<p class="mb-0 text-secondary small">Best for people who
									need full access to analytics data, but don't need to update
									business settings</p>
							</label>
						</div>
						<div class="form-check">
							<input type="radio" class="form-check-input flex-shrink-0"
								id="role4" name="radio" required> <label
								class="form-check-label" for="role4">
								<h6 class="mb-1">Support</h6>
								<p class="mb-0 text-secondary small">Best for employees who
									regularly refund payments and respond to disputes</p>
							</label>
						</div>
						<div class="form-check">
							<input type="radio" class="form-check-input flex-shrink-0"
								id="role5" name="radio" required> <label
								class="form-check-label" for="role5">
								<h6 class="mb-1">Trial</h6>
								<p class="mb-0 text-secondary small">Best for people who
									need to preview content data, but don't need to make any
									updates</p>
							</label>
							<div class="invalid-feedback">User role is required.</div>
						</div>
					</div>
					<div class="mb-3">
						<label for="userAvatar" class="form-label">Avatar</label> <input
							class="form-control" type="file" id="userAvatar" required
							style="max-width: 250px">
						<div class="invalid-feedback">User avatar is required.</div>
					</div>
				</form>
			</div>
			<div class="modal-footer border-0">
				<button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
				<button type="submit" form="taskForm" class="btn btn-primary px-5">Save</button>
			</div>
		</div>
	</div>
</div>


<!-- bottom.jsp -->
<%@include file="../../common/bottom.jsp" %>
