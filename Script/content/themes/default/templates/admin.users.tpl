<div class="card">
  <div class="card-header with-icon">
    {if $sub_view == ""}
      <div class="float-end">
        <!-- Export CSV -->
        <button type="button" class="btn btn-md btn-success" data-toggle="modal" data-url="#export-csv" data-options='{ "handle": "users" }'>
          <i class="fa-solid fa-file-csv"></i><span class="ml5 d-none d-lg-inline-block">{__("Export CSV")}</span>
        </button>
        <!-- Export CSV -->
      </div>
    {elseif $sub_view == "" && ($cug || $ncug)}
      <div class="float-end">
        <a href="{$system['system_url']}/{$control_panel['url']}/users" class="btn btn-md btn-light">
          <i class="fa fa-arrow-circle-left"></i><span class="ml5 d-none d-lg-inline-block">{__("Go Back")}</span>
        </a>
      </div>
    {elseif $sub_view == "admins"}
      <div class="float-end">
        <!-- Export CSV -->
        <button type="button" class="btn btn-md btn-success" data-toggle="modal" data-url="#export-csv" data-options='{ "handle": "admins" }'>
          <i class="fa-solid fa-file-csv"></i><span class="ml5 d-none d-lg-inline-block">{__("Export CSV")}</span>
        </button>
        <!-- Export CSV -->
      </div>
    {elseif $sub_view == "moderators"}
      <div class="float-end">
        <!-- Export CSV -->
        <button type="button" class="btn btn-md btn-success" data-toggle="modal" data-url="#export-csv" data-options='{ "handle": "moderators" }'>
          <i class="fa-solid fa-file-csv"></i><span class="ml5 d-none d-lg-inline-block">{__("Export CSV")}</span>
        </button>
        <!-- Export CSV -->
      </div>
    {elseif $sub_view == "banned"}
      <div class="float-end">
        <a href="{$system['system_url']}/{$control_panel['url']}/blacklist" class="btn btn-md btn-danger">
          <i class="fa fa-minus-circle"></i><span class="ml5 d-none d-lg-inline-block">{__("Manage Banned IPs")}</span>
        </a>
      </div>
    {elseif $sub_view == "stats"}
      <div class="float-end">
        <a href="{$system['system_url']}/{$control_panel['url']}/users/stats" class="btn btn-md btn-danger">
          <i class="fa-solid fa-arrow-rotate-left"></i><span class="ml5 d-none d-lg-inline-block">{__("Reset")}</span>
        </a>
        <!-- Export CSV -->
        <button type="button" class="btn btn-md btn-success" data-toggle="modal" data-url="#export-csv" data-options='{ "handle": "users_stats", "from": "{$from}", "to": "{$to}" }'>
          <i class="fa-solid fa-file-csv"></i><span class="ml5 d-none d-lg-inline-block">{__("Export CSV")}</span>
        </button>
        <!-- Export CSV -->
      </div>
    {elseif $sub_view == "find"}
      <div class="float-end">
        <a href="{$system['system_url']}/{$control_panel['url']}/users" class="btn btn-md btn-light">
          <i class="fa fa-arrow-circle-left mr5"></i>{__("Go Back")}
        </a>
      </div>
    {elseif $sub_view == "edit"}
      <div class="float-end">
        <a href="{$system['system_url']}/{$control_panel['url']}/users" class="btn btn-md btn-light">
          <i class="fa fa-arrow-circle-left"></i><span class="ml5 d-none d-lg-inline-block">{__("Go Back")}</span>
        </a>
        {if $user->_is_admin && $data['user_id'] != $user->_data['user_id']}
          <button class="btn btn-md btn-warning js_login-as" data-id="{$data['user_id']}" data-handle="connect">
            <i class="fa-solid fa-arrow-right-to-bracket"></i><span class="ml5 d-none d-lg-inline-block">{__("Login As")}</span>
          </button>
        {/if}
      </div>
    {/if}
    <i class="fa fa-user mr10"></i>{__("Users")}
    {if $sub_view == "" && $cug} &rsaquo; {__($cug['user_group_title']|capitalize)}{/if}
    {if $sub_view == "" && $ncug} &rsaquo; {__("Default")}{/if}
    {if $sub_view != "" && !in_array($sub_view, ['edit', 'not_activated', 'pending'])} &rsaquo; {__($sub_view|capitalize)}{/if}
    {if $sub_view == "not_activated"} &rsaquo; {__("Not Activated")}{/if}
    {if $sub_view == "pending"} &rsaquo; {__("Pending")}{/if}
    {if $sub_view == "edit"} &rsaquo; <a href="{$system['system_url']}/{$data['user_name']}">{$data['user_fullname']}</a>{/if}
  </div>

  {if $sub_view == "" || $sub_view == "admins" || $sub_view == "moderators" || $sub_view == "online" || $sub_view == "banned" || $sub_view == "not_activated" || $sub_view == "pending" || $sub_view == "find"}

    <div class="card-body">

      {if $sub_view == ""}
        <div class="row">
          <div class="col-md-6 col-lg-6 col-xl-3">
            <div class="stat-panel bg-gradient-primary">
              <div class="stat-cell narrow">
                <i class="fa fa-users bg-icon"></i>
                <span class="text-xxlg">{$insights['users']}</span><br>
                <span class="text-lg">{__("Users")}</span><br>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-6 col-xl-3">
            <div class="stat-panel bg-gradient-warning">
              <div class="stat-cell narrow">
                <i class="fa fa-clock bg-icon"></i>
                <span class="text-xxlg">{$insights['pending']}</span><br>
                <span class="text-lg">{__("Pending Users")}</span><br>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-6 col-xl-3">
            <div class="stat-panel bg-gradient-danger">
              <div class="stat-cell narrow">
                <i class="fa fa-envelope bg-icon"></i>
                <span class="text-xxlg">{$insights['not_activated']}</span><br>
                <span class="text-lg">{__("Not Activated")}</span><br>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-6 col-xl-3">
            <div class="stat-panel bg-gradient-red">
              <div class="stat-cell narrow">
                <i class="fa fa-minus-circle bg-icon"></i>
                <span class="text-xxlg">{$insights['banned']}</span><br>
                <span class="text-lg">{__("Banned")}</span><br>
              </div>
            </div>
          </div>
        </div>
      {/if}

      <!-- search form -->
      <div class="mb20">
        <form class="d-flex flex-row align-items-center flex-wrap" action="{$system['system_url']}/{$control_panel['url']}/users/find" method="get">
          <div class="form-group mb0">
            <div class="input-group">
              <input type="text" class="form-control" name="query">
              <button type="submit" class="btn btn-sm btn-light"><i class="fas fa-search mr5"></i>{__("Search")}</button>
            </div>
          </div>
        </form>
        <div class="form-text small">
          {__("Search by Username, First Name, Last Name, Email or Phone")}
        </div>
      </div>
      <!-- search form -->

      <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover">
          <thead>
            <tr>
              <th>{__("ID")}</th>
              <th>{__("Name")}</th>
              <th>{__("Username")}</th>
              <th>{__("Joined")}</th>
              <th>{__("Activated")}</th>
              <th>{__("Approved")}</th>
              <th>{__("Actions")}</th>
            </tr>
          </thead>
          <tbody>
            {if $rows}
              {foreach $rows as $row}
                <tr>
                  <td><a href="{$system['system_url']}/{$row['user_name']}" target="_blank">{$row['user_id']}</a></td>
                  <td>
                    <a target="_blank" href="{$system['system_url']}/{$row['user_name']}">
                      <img class="tbl-image" src="{$row['user_picture']}">
                      {$row['user_firstname']} {$row['user_lastname']}
                    </a>
                  </td>
                  <td>
                    <a href="{$system['system_url']}/{$row['user_name']}" target="_blank">
                      {$row['user_name']}
                    </a>
                  </td>
                  <td>{$row['user_registered']|date_format:"%e %B %Y"}</td>
                  <td>
                    {if $row['user_activated']}
                      <span class="badge rounded-pill badge-lg bg-success">{__("Yes")}</span>
                    {else}
                      <span class="badge rounded-pill badge-lg bg-danger">{__("No")}</span>
                    {/if}
                  </td>
                  <td>
                    {if $row['user_approved']}
                      <span class="badge rounded-pill badge-lg bg-success">{__("Yes")}</span>
                    {else}
                      <span class="badge rounded-pill badge-lg bg-danger">{__("No")}</span>
                    {/if}
                  </td>
                  <td>
                    {if $sub_view == "pending"}
                      <button data-bs-toggle="tooltip" title='{__("Approve")}' class="btn btn-sm btn-icon btn-rounded btn-success js_user-approve" data-id="{$row['user_id']}">
                        <i class="fa fa-check"></i>
                      </button>
                    {/if}
                    <a data-bs-toggle="tooltip" title='{__("Edit")}' href="{$system['system_url']}/{$control_panel['url']}/users/edit/{$row['user_id']}" class="btn btn-sm btn-icon btn-rounded btn-primary">
                      <i class="fa fa-pencil-alt"></i>
                    </a>
                    <button data-bs-toggle="tooltip" title='{__("Delete")}' class="btn btn-sm btn-icon btn-rounded btn-danger js_admin-deleter" data-handle="user" data-id="{$row['user_id']}">
                      <i class="fa fa-trash-alt"></i>
                    </button>
                  </td>
                </tr>
              {/foreach}
            {else}
              <tr>
                <td colspan="7" class="text-center">
                  {__("No data to show")}
                </td>
              </tr>
            {/if}
          </tbody>
        </table>
      </div>
      {$pager}
    </div>

  {elseif $sub_view == "stats"}

    <div class="card-body">

      <!-- search & data range forms -->
      <div class="row">
        <!-- search form -->
        <div class="col-xl-6 mb20">
          <form class="d-flex flex-row align-items-center flex-wrap js_search-forms" method="get">
            <div class="form-group mb0">
              <div class="input-group">
                <input type="text" class="form-control" name="query" value="{$query}">
                <button type="submit" class="btn btn-sm btn-light"><i class="fas fa-search mr5"></i>{__("Search")}</button>
              </div>
            </div>
          </form>
          <div class="form-text small">
            {__("Search by Username, First Name, Last Name, Email or Phone")}
          </div>
        </div>
        <!-- search form -->

        <!-- data range form -->
        <div class="col-xl-6 mb20">
          <form class="d-flex flex-row align-items-center flex-wrap" action="{$system['system_url']}/{$control_panel['url']}/users/stats" method="get">
            <div class="form-group mb0">
              <div class="input-group">
                <input type="date" class="form-control" name="from" value="{$from}" placeholder="{__("From")}" required>
                <input type="date" class="form-control" name="to" value="{$to}" placeholder="{__("To")}" required>
                <button type="submit" class="btn btn-sm btn-light"><i class="fas fa-filter mr5"></i>{__("Filter")}</button>
              </div>
            </div>
          </form>
          <div class="form-text small">
            {__("Select date range to filter the results by posts count")}
          </div>
        </div>
        <!-- data range form -->
      </div>
      <!-- search & data range forms -->

      <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover">
          <thead>
            <tr>
              <th>{__("ID")}</th>
              <th>{__("Name")}</th>
              <th>{__("Username")}</th>
              <th>{__("Date Range")}</th>
              <th>{__("Posts Count")}</th>
              <th>{__("Actions")}</th>
            </tr>
          </thead>
          <tbody>
            {if $rows}
              {foreach $rows as $row}
                <tr>
                  <td><a href="{$system['system_url']}/{$row['user_name']}" target="_blank">{$row['user_id']}</a></td>
                  <td>
                    <a target="_blank" href="{$system['system_url']}/{$row['user_name']}">
                      <img class="tbl-image" src="{$row['user_picture']}">
                      {$row['user_firstname']} {$row['user_lastname']}
                    </a>
                  </td>
                  <td>
                    <a href="{$system['system_url']}/{$row['user_name']}" target="_blank">
                      {$row['user_name']}
                    </a>
                  </td>
                  <td>
                    {if $from && $to}
                      {$from|date_format:"%e %b %Y"} - {$to|date_format:"%e %b %Y"}
                    {else}
                      {__("All Time")}
                    {/if}
                  </td>
                  <td>
                    {$row['posts_count']}
                  </td>
                  <td>
                    <a data-bs-toggle="tooltip" title='{__("Edit")}' href="{$system['system_url']}/{$control_panel['url']}/users/edit/{$row['user_id']}" class="btn btn-sm btn-icon btn-rounded btn-primary">
                      <i class="fa fa-pencil-alt"></i>
                    </a>
                    <button data-bs-toggle="tooltip" title='{__("Delete")}' class="btn btn-sm btn-icon btn-rounded btn-danger js_admin-deleter" data-handle="user" data-id="{$row['user_id']}">
                      <i class="fa fa-trash-alt"></i>
                    </button>
                  </td>
                </tr>
              {/foreach}
            {else}
              <tr>
                <td colspan="6" class="text-center">
                  {__("No data to show")}
                </td>
              </tr>
            {/if}
          </tbody>
        </table>
      </div>
      {$pager}
    </div>

  {elseif $sub_view == "edit"}

    <div class="card-body">
      <div class="row">
        <div class="col-12 col-md-2 text-center mb20">
          <img class="img-fluid img-thumbnail rounded-circle" src="{$data['user_picture']}">
        </div>
        <div class="col-12 col-md-5 mb20">
          <ul class="list-group">
            <li class="list-group-item">
              <span class="float-end badge badge-lg rounded-pill bg-secondary">{$data['user_id']}</span>
              {__("User ID")}
            </li>
            <li class="list-group-item">
              <span class="float-end badge badge-lg rounded-pill bg-secondary">{$data['user_registered']|date_format:"%e %B %Y"}</span>
              {__("Joined")}
            </li>
            <li class="list-group-item">
              <span class="float-end badge badge-lg rounded-pill bg-secondary">{$data['user_last_seen']|date_format:"%e %B %Y"}</span>
              {__("Last Login")}
            </li>
          </ul>
        </div>
        <div class="col-12 col-md-5 mb20">
          <ul class="list-group">
            {if $system['friends_enabled']}
              <li class="list-group-item">
                <span class="float-end badge badge-lg rounded-pill bg-secondary">{$data['friends']}</span>
                {__("Friends")}
              </li>
            {/if}
            <li class="list-group-item">
              <span class="float-end badge badge-lg rounded-pill bg-secondary">{$data['followings']}</span>
              {__("Followings")}
            </li>
            <li class="list-group-item">
              <span class="float-end badge badge-lg rounded-pill bg-secondary">{$data['followers']}</span>
              {__("Followers")}
            </li>
          </ul>
        </div>
      </div>

      <!-- tabs nav -->
      <ul class="nav nav-tabs mb20">
        <li class="nav-item">
          <a class="nav-link active" href="#account" data-bs-toggle="tab">
            <i class="fa fa-cog fa-fw mr5"></i><strong class="mr5">{__("Account")}</strong>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#profile" data-bs-toggle="tab">
            <i class="fa fa-user fa-fw mr5"></i><strong class="mr5">{__("Profile")}</strong>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#privacy" data-bs-toggle="tab">
            <i class="fa fa-lock fa-fw mr5"></i><strong class="mr5">{__("Privacy")}</strong>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#security" data-bs-toggle="tab">
            <i class="fa fa-shield-alt fa-fw mr5"></i><strong class="mr5">{__("Security")}</strong>
          </a>
        </li>
        {if $system['packages_enabled']}
          <li class="nav-item">
            <a class="nav-link" href="#membership" data-bs-toggle="tab">
              <i class="fa fa-id-card fa-fw mr5"></i><strong class="mr5">{__("Membership")}</strong>
            </a>
          </li>
        {/if}
        {if $system['wallet_enabled'] || $system['points_enabled']}
          <li class="nav-item">
            <a class="nav-link" href="#extra" data-bs-toggle="tab">
              <i class="fa fa-cubes fa-fw mr5"></i><strong class="mr5">{__("Extra")}</strong>
            </a>
          </li>
        {/if}
      </ul>
      <!-- tabs nav -->

      <!-- tabs content -->
      <div class="tab-content">
        <!-- account tab -->
        <div class="tab-pane active" id="account">
          <form class="js_ajax-forms" data-url="admin/users.php?id={$data['user_id']}&do=edit_account">
            <div class="row form-group">
              <label class="col-md-3 form-label">
                {__("Verified User")}
              </label>
              <div class="col-md-9">
                <label class="switch" for="user_verified">
                  <input type="checkbox" name="user_verified" id="user_verified" {if $data['user_verified']}checked{/if}>
                  <span class="slider round"></span>
                </label>
              </div>
            </div>

            <div class="row form-group">
              <label class="col-md-3 form-label">
                {__("Banned")}
              </label>
              <div class="col-md-9">
                <label class="switch" for="user_banned">
                  <input type="checkbox" name="user_banned" id="user_banned" {if $data['user_banned']}checked{/if}>
                  <span class="slider round"></span>
                </label>
              </div>
            </div>

            <div class="row form-group">
              <label class="col-md-3 form-label">
                {__("Ban Message")}
              </label>
              <div class="col-md-9">
                <textarea class="form-control" name="user_banned_message">{$data['user_banned_message']}</textarea>
                <div class="form-text">
                  {__("The message that is presented on this profile, if empty 404 error will be used instead")}
                </div>
              </div>
            </div>

            <div class="row form-group">
              <label class="col-md-3 form-label">
                {__("Account Activated")}
              </label>
              <div class="col-md-9">
                <label class="switch" for="user_activated">
                  <input type="checkbox" name="user_activated" id="user_activated" {if $data['user_activated']}checked{/if}>
                  <span class="slider round"></span>
                </label>
                <div class="form-text">
                  {if !$system['activation_enabled']}
                    {__("Account activation disabled from your system")} <a target="_blank" href="{$system['system_url']}/{$control_panel['url']}/settings/registration">{{__("Registration Settings")}}</a>
                  {else}
                    {if $system['activation_type'] == "email"}
                      {__("Account activation enabled from your system settings by")} {__("Email")}
                    {else}
                      {__("Account activation enabled from your system settings by")} {__("SMS")}
                    {/if}
                  {/if}
                </div>
              </div>
            </div>

            <div class="row form-group">
              <label class="col-md-3 form-label">
                {__("Getting Started")}
              </label>
              <div class="col-md-9">
                <label class="switch" for="user_started">
                  <input type="checkbox" name="user_started" id="user_started" {if $data['user_started']}checked{/if}>
                  <span class="slider round"></span>
                </label>
                <div class="form-text">
                  {__("If enabled user will see the getting started page")}
                </div>
              </div>
            </div>

            {if $system['two_factor_enabled'] && $data['user_two_factor_enabled']}
              <div class="row form-group">
                <label class="col-md-3 form-label">
                  {__("Two-Factor Authentication")}
                </label>
                <div class="col-md-9">
                  <label class="switch" for="user_two_factor_enabled">
                    <input type="checkbox" name="user_two_factor_enabled" id="user_two_factor_enabled" {if $data['user_two_factor_enabled']}checked{/if}>
                    <span class="slider round"></span>
                  </label>
                </div>
              </div>
            {/if}

            <div class="row form-group">
              <label class="col-md-3 form-label">
                {__("Demo Account")}
              </label>
              <div class="col-md-9">
                <label class="switch" for="user_demo">
                  <input type="checkbox" name="user_demo" id="user_demo" {if $data['user_demo']}checked{/if}>
                  <span class="slider round"></span>
                </label>
                <div class="form-text">
                  {__("If demo mode enabled this user will not be able to do anything")}
                </div>
              </div>
            </div>

            <div class="row form-group">
              <label class="col-md-3 form-label">
                {__("User Group")}
              </label>
              <div class="col-md-9">
                <select class="form-select" name="user_group">
                  <option value="1" {if $data['user_group'] == '1'}selected{/if}>
                    {__("Administrators")}
                  </option>
                  <option value="2" {if $data['user_group'] == '2'}selected{/if}>
                    {__("Moderators")}
                  </option>
                  <option value="3" {if $data['user_group'] == '3' && !$data['user_group_custom']}selected{/if}>
                    {__("Users")}
                  </option>
                  {foreach $data['user_groups'] as $user_group}
                    <option value="cusg_{$user_group['user_group_id']}" {if $data['user_group_custom'] == $user_group['user_group_id']}selected{/if}>
                      {$user_group['user_group_title']}
                    </option>
                  {/foreach}
                </select>
                <div class="form-text">
                  {__("If user subscribed to a package so this package permissions will be used instead")}
                </div>
              </div>
            </div>

            <div class="row form-group">
              <label class="col-md-3 form-label">
                {__("Username")}
              </label>
              <div class="col-md-9">
                <div class="input-group">
                  <span class="input-group-text d-none d-sm-block">{$system['system_url']}/</span>
                  <input type="text" class="form-control" name="user_name" value="{$data['user_name']}">
                </div>
              </div>
            </div>

            <div class="row form-group">
              <label class="col-md-3 form-label">
                {__("Email Address")}
              </label>
              <div class="col-md-9">
                <div class="input-group">
                  <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                  <input type="text" class="form-control" name="user_email" value="{$data['user_email']}">
                </div>
              </div>
            </div>

            <div class="row form-group">
              <label class="col-md-3 form-label">
                {__("Email Verified")}
              </label>
              <div class="col-md-9">
                <label class="switch" for="user_email_verified">
                  <input type="checkbox" name="user_email_verified" id="user_email_verified" {if $data['user_email_verified']}checked{/if}>
                  <span class="slider round"></span>
                </label>
              </div>
            </div>

            {if ($system['activation_enabled'] && $system['activation_type'] == "sms") || ($system['two_factor_enabled'] && $system['two_factor_type'] == "sms")}
              <div class="row form-group">
                <label class="col-md-3 form-label">
                  {__("Phone Number")}
                </label>
                <div class="col-md-9">
                  <input type="text" class="form-control" name="user_phone" value="{$data['user_phone']}">
                  <div class="form-text">
                    {__("Phone number (eg. +905...)")}
                  </div>
                </div>
              </div>

              <div class="row form-group">
                <label class="col-md-3 form-label">
                  {__("Phone Verified")}
                </label>
                <div class="col-md-9">
                  <label class="switch" for="user_phone_verified">
                    <input type="checkbox" name="user_phone_verified" id="user_phone_verified" {if $data['user_phone_verified']}checked{/if}>
                    <span class="slider round"></span>
                  </label>
                </div>
              </div>
            {/if}

            <div class="row form-group">
              <label class="col-md-3 form-label">
                {__("Password")}
              </label>
              <div class="col-md-9">
                <input type="password" class="form-control" name="user_password">
              </div>
            </div>

            <!-- success -->
            <div class="alert alert-success mb0 mt20 x-hidden"></div>
            <!-- success -->

            <!-- error -->
            <div class="alert alert-danger mb0 mt20 x-hidden"></div>
            <!-- error -->

            <div class="card-footer-fake text-end">
              <button type="button" class="btn btn-danger js_admin-deleter" data-handle="user_posts" data-id="{$data['user_id']}" data-delete-message="{__("Are you sure you want to delete all posts?")}">
                <i class="fa fa-trash-alt mr5"></i>{__("Delete Posts")}
              </button>
              <button type="button" class="btn btn-danger js_admin-deleter" data-handle="user" data-id="{$data['user_id']}" data-redirect="{$system['system_url']}/{$control_panel['url']}/users">
                <i class="fa fa-trash-alt mr5"></i>{__("Delete User")}
              </button>
              <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
            </div>
          </form>
        </div>
        <!-- account tab -->

        <!-- profile tab -->
        <div class="tab-pane" id="profile">
          <form class="js_ajax-forms" data-url="admin/users.php?id={$data['user_id']}&do=edit_profile">
            <div class="heading-small mb20">
              {__("Basic")}
            </div>
            <div class="pl-md-4">
              <div class="row">
                <div class="form-group col-md-6">
                  <label class="form-label">{__("First Name")}</label>
                  <input class="form-control" name="user_firstname" value="{$data['user_firstname']}">
                </div>

                <div class="form-group col-md-6">
                  <label class="form-label">{__("Last Name")}</label>
                  <input class="form-control" name="user_lastname" value="{$data['user_lastname']}">
                </div>
              </div>

              <div class="row">
                <div class="form-group col-md-6">
                  <label class="form-label">{__("I am")}</label>
                  <select class="form-select" name="user_gender">
                    <option value="none">{__("Select Sex")}:</option>
                    {foreach $genders as $gender}
                      <option {if $data['user_gender'] == $gender['gender_id']}selected{/if} value="{$gender['gender_id']}">{$gender['gender_name']}</option>
                    {/foreach}
                  </select>
                </div>

                <div class="form-group col-md-6">
                  <label class="form-label">{__("Relationship Status")}</label>
                  <select class="form-select" name="user_relationship">
                    <option value="none">{__("Select Relationship")}</option>
                    <option {if $data['user_relationship'] == "single"}selected{/if} value="single">{__("Single")}</option>
                    <option {if $data['user_relationship'] == "relationship"}selected{/if} value="relationship">{__("In a relationship")}</option>
                    <option {if $data['user_relationship'] == "married"}selected{/if} value="married">{__("Married")}</option>
                    <option {if $data['user_relationship'] == "complicated"}selected{/if} value="complicated">{__("It's complicated")}</option>
                    <option {if $data['user_relationship'] == "separated"}selected{/if} value="separated">{__("Separated")}</option>
                    <option {if $data['user_relationship'] == "divorced"}selected{/if} value="divorced">{__("Divorced")}</option>
                    <option {if $data['user_relationship'] == "widowed"}selected{/if} value="widowed">{__("Widowed")}</option>
                  </select>
                </div>
              </div>

              <div class="row">
                <div class="form-group col-md-6">
                  <label class="form-label">{__("Country")}</label>
                  <select class="form-select" name="user_country">
                    <option value="none">{__("Select Country")}</option>
                    {foreach $countries as $country}
                      <option {if $data['user_country'] == $country['country_id']}selected{/if} value="{$country['country_id']}">{$country['country_name']}</option>
                    {/foreach}
                  </select>
                </div>

                <div class="form-group col-md-6">
                  <label class="form-label">{__("Website")}</label>
                  <input type="text" class="form-control" name="user_website" value="{$data['user_website']}">
                </div>
              </div>

              <div class="form-group">
                <label class="form-label">{__("Birthdate")}</label>
                <div class="row">
                  <div class="col">
                    <select class="form-select" name="birth_month">
                      <option value="none">{__("Select Month")}</option>
                      <option {if $data['user_birthdate_parsed']['month'] == '1'}selected{/if} value="1">{__("Jan")}</option>
                      <option {if $data['user_birthdate_parsed']['month'] == '2'}selected{/if} value="2">{__("Feb")}</option>
                      <option {if $data['user_birthdate_parsed']['month'] == '3'}selected{/if} value="3">{__("Mar")}</option>
                      <option {if $data['user_birthdate_parsed']['month'] == '4'}selected{/if} value="4">{__("Apr")}</option>
                      <option {if $data['user_birthdate_parsed']['month'] == '5'}selected{/if} value="5">{__("May")}</option>
                      <option {if $data['user_birthdate_parsed']['month'] == '6'}selected{/if} value="6">{__("Jun")}</option>
                      <option {if $data['user_birthdate_parsed']['month'] == '7'}selected{/if} value="7">{__("Jul")}</option>
                      <option {if $data['user_birthdate_parsed']['month'] == '8'}selected{/if} value="8">{__("Aug")}</option>
                      <option {if $data['user_birthdate_parsed']['month'] == '9'}selected{/if} value="9">{__("Sep")}</option>
                      <option {if $data['user_birthdate_parsed']['month'] == '10'}selected{/if} value="10">{__("Oct")}</option>
                      <option {if $data['user_birthdate_parsed']['month'] == '11'}selected{/if} value="11">{__("Nov")}</option>
                      <option {if $data['user_birthdate_parsed']['month'] == '12'}selected{/if} value="12">{__("Dec")}</option>
                    </select>
                  </div>
                  <div class="col">
                    <select class="form-select" name="birth_day">
                      <option value="none">{__("Select Day")}</option>
                      {for $i=1 to 31}
                        <option {if $data['user_birthdate_parsed']['day'] == $i}selected{/if} value="{$i}">{$i}</option>
                      {/for}
                    </select>
                  </div>
                  <div class="col">
                    <select class="form-select" name="birth_year">
                      <option value="none">{__("Select Year")}</option>
                      {for $i=1905 to 2015}
                        <option {if $data['user_birthdate_parsed']['year'] == $i}selected{/if} value="{$i}">{$i}</option>
                      {/for}
                    </select>
                  </div>
                </div>
              </div>

              <div class="form-group">
                <label class="form-label">{__("About Me")}</label>
                <textarea class="form-control" name="user_biography">{$data['user_biography']}</textarea>
              </div>

              <!-- custom fields -->
              {if $custom_fields['basic']}
                {include file='__custom_fields.tpl' _custom_fields=$custom_fields['basic'] _registration=false}
              {/if}
              <!-- custom fields -->
            </div>

            <div class="divider"></div>

            <div class="heading-small mb20">
              {__("Work")}
            </div>
            <div class="pl-md-4">
              <div class="form-group">
                <label class="form-label">{__("Work Title")}</label>
                <input type="text" class="form-control" name="user_work_title" value="{$data['user_work_title']}">
              </div>

              <div class="row">
                <div class="form-group col-md-6">
                  <label class="form-label">{__("Work Place")}</label>
                  <input type="text" class="form-control" name="user_work_place" value="{$data['user_work_place']}">
                </div>

                <div class="form-group col-md-6">
                  <label class="form-label">{__("Work Website")}</label>
                  <input type="text" class="form-control" name="user_work_url" value="{$data['user_work_url']}">
                </div>
              </div>

              <!-- custom fields -->
              {if $custom_fields['work']}
                {include file='__custom_fields.tpl' _custom_fields=$custom_fields['work'] _registration=false}
              {/if}
              <!-- custom fields -->
            </div>

            <div class="divider"></div>

            <div class="heading-small mb20">
              {__("Location")}
            </div>
            <div class="pl-md-4">
              <div class="form-group">
                <label class="form-label">{__("Current City")}</label>
                <input type="text" class="form-control" name="user_current_city" value="{$data['user_current_city']}">
              </div>

              <div class="form-group">
                <label class="form-label">{__("Hometown")}</label>
                <input type="text" class="form-control" name="user_hometown" value="{$data['user_hometown']}">
              </div>

              <!-- custom fields -->
              {if $custom_fields['location']}
                {include file='__custom_fields.tpl' _custom_fields=$custom_fields['location'] _registration=false}
              {/if}
              <!-- custom fields -->
            </div>

            <div class="divider"></div>

            <div class="heading-small mb20">
              {__("Education")}
            </div>
            <div class="pl-md-4">
              <div class="form-group">
                <label class="form-label">{__("School")}</label>
                <input type="text" class="form-control" name="user_edu_school" value="{$data['user_edu_school']}">
              </div>

              <div class="row">
                <div class="form-group col-md-6">
                  <label class="form-label">{__("Major")}</label>
                  <input type="text" class="form-control" name="user_edu_major" value="{$data['user_edu_major']}">
                </div>

                <div class="form-group col-md-6">
                  <label class="form-label">{__("Class")}</label>
                  <input type="text" class="form-control" name="user_edu_class" value="{$data['user_edu_class']}">
                </div>
              </div>

              <!-- custom fields -->
              {if $custom_fields['education']}
                {include file='__custom_fields.tpl' _custom_fields=$custom_fields['education'] _registration=false}
              {/if}
              <!-- custom fields -->
            </div>

            <div class="divider"></div>

            <div class="heading-small mb20">
              {__("Social Links")}
            </div>
            <div class="pl-md-4">
              <div class="row">
                <div class="form-group col-md-6">
                  <label class="form-label">{__("Facebook Profile URL")}</label>
                  <div class="input-group">
                    <span class="input-group-text bg-transparent">
                      {include file='__svg_icons.tpl' icon="facebook" width="24px" height="24px"}
                    </span>
                    <input type="text" class="form-control" name="facebook" value="{$data['user_social_facebook']}">
                  </div>
                </div>

                <div class="form-group col-md-6">
                  <label class="form-label">{__("X Profile URL")}</label>
                  <div class="input-group">
                    <span class="input-group-text bg-transparent">
                      {include file='__svg_icons.tpl' icon="twitter" width="24px" height="24px"}
                    </span>
                    <input type="text" class="form-control" name="twitter" value="{$data['user_social_twitter']}">
                  </div>
                </div>

                <div class="form-group col-md-6">
                  <label class="form-label">{__("YouTube Profile URL")}</label>
                  <div class="input-group">
                    <span class="input-group-text bg-transparent">
                      {include file='__svg_icons.tpl' icon="youtube" width="24px" height="24px"}
                    </span>
                    <input type="text" class="form-control" name="youtube" value="{$data['user_social_youtube']}">
                  </div>
                </div>

                <div class="form-group col-md-6">
                  <label class="form-label">{__("Instagram Profile URL")}</label>
                  <div class="input-group">
                    <span class="input-group-text bg-transparent">
                      {include file='__svg_icons.tpl' icon="instagram" width="24px" height="24px"}
                    </span>
                    <input type="text" class="form-control" name="instagram" value="{$data['user_social_instagram']}">
                  </div>
                </div>

                <div class="form-group col-md-6">
                  <label class="form-label">{__("LinkedIn Profile URL")}</label>
                  <div class="input-group">
                    <span class="input-group-text bg-transparent">
                      {include file='__svg_icons.tpl' icon="linkedin" width="24px" height="24px"}
                    </span>
                    <input type="text" class="form-control" name="linkedin" value="{$data['user_social_linkedin']}">
                  </div>
                </div>

                <div class="form-group col-md-6">
                  <label class="form-label">{__("Vkontakte Profile URL")}</label>
                  <div class="input-group">
                    <span class="input-group-text bg-transparent">
                      {include file='__svg_icons.tpl' icon="vk" width="24px" height="24px"}
                    </span>
                    <input type="text" class="form-control" name="vkontakte" value="{$data['user_social_vkontakte']}">
                  </div>
                </div>
              </div>
            </div>

            {if $custom_fields['other']}
              <div class="divider"></div>
              <div class="heading-small mb20">
                {__("Other")}
              </div>
              <div class="pl-md-4">
                <!-- custom fields -->
                {if $custom_fields['other']}
                  {include file='__custom_fields.tpl' _custom_fields=$custom_fields['other'] _registration=false}
                {/if}
                <!-- custom fields -->
              </div>
            {/if}

            <!-- success -->
            <div class="alert alert-success x-hidden"></div>
            <!-- success -->

            <!-- error -->
            <div class="alert alert-danger x-hidden"></div>
            <!-- error -->

            <div class="card-footer-fake text-end">
              <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
            </div>
          </form>
        </div>
        <!-- profile tab -->

        <!-- privacy tab -->
        <div class="tab-pane" id="privacy">
          <form class="js_ajax-forms" data-url="admin/users.php?id={$data['user_id']}&do=edit_privacy">
            {if $system['chat_enabled']}
              <div class="form-table-row">
                <div class="avatar">
                  {include file='__svg_icons.tpl' icon="chat" class="main-icon" width="40px" height="40px"}
                </div>
                <div>
                  <div class="form-label h6">{__("Chat Enabled")}</div>
                  <div class="form-text d-none d-sm-block">{__("If chat disabled you will appear offline and will no see who is online too")}</div>
                </div>
                <div class="text-end">
                  <label class="switch" for="user_chat_enabled">
                    <input type="checkbox" name="user_chat_enabled" id="user_chat_enabled" {if $data['user_chat_enabled']}checked{/if}>
                    <span class="slider round"></span>
                  </label>
                </div>
              </div>
            {/if}

            <div class="form-table-row">
              <div class="avatar">
                {include file='__svg_icons.tpl' icon="account_activation" class="main-icon" width="40px" height="40px"}
              </div>
              <div>
                <div class="form-label h6">{__("Email you with our newsletter")}</div>
                <div class="form-text d-none d-sm-block">{__("From time to time we send newsletter email to all of our members")}</div>
              </div>
              <div class="text-end">
                <label class="switch" for="user_newsletter_enabled">
                  <input type="checkbox" name="user_newsletter_enabled" id="user_newsletter_enabled" {if $data['user_newsletter_enabled']}checked{/if}>
                  <span class="slider round"></span>
                </label>
              </div>
            </div>

            {if $system['tips_enabled']}
              <div class="form-table-row">
                <div class="avatar">
                  {include file='__svg_icons.tpl' icon="tip" class="main-icon" width="40px" height="40px"}
                </div>
                <div>
                  <div class="form-label h6">{__("Tips Enabled")}</div>
                  <div class="form-text d-none d-sm-block">{__("Allow the send tips button on your profile")}</div>
                </div>
                <div class="text-end">
                  <label class="switch" for="user_tips_enabled">
                    <input type="checkbox" name="user_tips_enabled" id="user_tips_enabled" {if $data['user_tips_enabled']}checked{/if}>
                    <span class="slider round"></span>
                  </label>
                </div>
              </div>
            {/if}

            <div class="form-table-row">
              <div class="avatar">
                {include file='__svg_icons.tpl' icon="spy" class="main-icon" width="40px" height="40px"}
              </div>
              <div>
                <div class="form-label h6">
                  {if $system['friends_enabled']}{__("Hide from friends suggestions list?")}{else}{__("Hide from followings suggestions list?")}{/if}
                </div>
                <div class="form-text d-none d-sm-block">{__("Enable this option to hide your profile from the suggestions list")}</div>
              </div>
              <div class="text-end">
                <label class="switch" for="user_suggestions_hidden">
                  <input type="checkbox" name="user_suggestions_hidden" id="user_suggestions_hidden" {if $data['user_suggestions_hidden']}checked{/if}>
                  <span class="slider round"></span>
                </label>
              </div>
            </div>

            <div class="row">
              <div class="form-group col-md-6">
                <label class="form-label">{__("Who can message you")}</label>
                <div class="input-group">
                  <span class="input-group-text"><i class="fas fa-message"></i></span>
                  <select class="form-select" name="user_privacy_chat">
                    <option {if $data['user_privacy_chat'] == "public"}selected{/if} value="public">
                      {__("Everyone")}
                    </option>
                    <option {if $data['user_privacy_chat'] == "friends"}selected{/if} value="friends">
                      {if $system['friends_enabled']}{__("Friends")}{else}{__("Followers")}{/if}
                    </option>
                    <option {if $data['user_privacy_chat'] == "me"}selected{/if} value="me">
                      {__("No One")}
                    </option>
                  </select>
                </div>
              </div>

              {if $system['pokes_enabled']}
                <div class="form-group col-md-6">
                  <label class="form-label">{__("Who can poke you")}</label>
                  <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-hand-point-right"></i></span>
                    <select class="form-select" name="user_privacy_poke">
                      <option {if $data['user_privacy_poke'] == "public"}selected{/if} value="public">
                        {__("Everyone")}
                      </option>
                      <option {if $data['user_privacy_poke'] == "friends"}selected{/if} value="friends">
                        {if $system['friends_enabled']}{__("Friends")}{else}{__("Followers")}{/if}
                      </option>
                      <option {if $data['user_privacy_poke'] == "me"}selected{/if} value="me">
                        {__("No One")}
                      </option>
                    </select>
                  </div>
                </div>
              {/if}

              {if $system['gifts_enabled']}
                <div class="form-group col-md-6">
                  <label class="form-label">{__("Who can send you gifts")}</label>
                  <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-gift"></i></span>
                    <select class="form-select" name="user_privacy_gifts">
                      <option {if $data['user_privacy_gifts'] == "public"}selected{/if} value="public">
                        {__("Everyone")}
                      </option>
                      <option {if $data['user_privacy_gifts'] == "friends"}selected{/if} value="friends">
                        {if $system['friends_enabled']}{__("Friends")}{else}{__("Followers")}{/if}
                      </option>
                      <option {if $data['user_privacy_gifts'] == "me"}selected{/if} value="me">
                        {__("No One")}
                      </option>
                    </select>
                  </div>
                </div>
              {/if}

              {if $system['wall_posts_enabled']}
                <div class="form-group col-md-6">
                  <label class="form-label">{__("Who can post on your wall")}</label>
                  <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-newspaper"></i></span>
                    <select class="form-select" name="user_privacy_wall">
                      <option {if $data['user_privacy_wall'] == "public"}selected{/if} value="public">
                        {__("Everyone")}
                      </option>
                      <option {if $data['user_privacy_wall'] == "friends"}selected{/if} value="friends">
                        {if $system['friends_enabled']}{__("Friends")}{else}{__("Followers")}{/if}
                      </option>
                      <option {if $data['user_privacy_wall'] == "me"}selected{/if} value="me">
                        {__("Just Me")}
                      </option>
                    </select>
                  </div>
                </div>
              {/if}

              <div class="form-group col-md-6">
                <label class="form-label">{__("Who can see your")} {__("gender")}</label>
                <div class="input-group">
                  <span class="input-group-text"><i class="fas fa-venus-mars"></i></span>
                  <select class="form-select" name="user_privacy_gender">
                    <option {if $data['user_privacy_gender'] == "public"}selected{/if} value="public">
                      {__("Everyone")}
                    </option>
                    <option {if $data['user_privacy_gender'] == "friends"}selected{/if} value="friends">
                      {if $system['friends_enabled']}{__("Friends")}{else}{__("Followers")}{/if}
                    </option>
                    <option {if $data['user_privacy_gender'] == "me"}selected{/if} value="me">
                      {__("Just Me")}
                    </option>
                  </select>
                </div>
              </div>

              {if $system['relationship_info_enabled']}
                <div class="form-group col-md-6">
                  <label class="form-label">{__("Who can see your")} {__("relationship")}</label>
                  <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-heart"></i></span>
                    <select class="form-select" name="user_privacy_relationship">
                      <option {if $data['user_privacy_relationship'] == "public"}selected{/if} value="public">
                        {__("Everyone")}
                      </option>
                      <option {if $data['user_privacy_relationship'] == "friends"}selected{/if} value="friends">
                        {if $system['friends_enabled']}{__("Friends")}{else}{__("Followers")}{/if}
                      </option>
                      <option {if $data['user_privacy_relationship'] == "me"}selected{/if} value="me">
                        {__("Just Me")}
                      </option>
                    </select>
                  </div>
                </div>
              {/if}

              <div class="form-group col-md-6">
                <label class="form-label">{__("Who can see your")} {__("birthdate")}</label>
                <div class="input-group">
                  <span class="input-group-text"><i class="fas fa-birthday-cake"></i></span>
                  <select class="form-select" name="user_privacy_birthdate">
                    <option {if $data['user_privacy_birthdate'] == "public"}selected{/if} value="public">
                      {__("Everyone")}
                    </option>
                    <option {if $data['user_privacy_birthdate'] == "friends"}selected{/if} value="friends">
                      {if $system['friends_enabled']}{__("Friends")}{else}{__("Followers")}{/if}
                    </option>
                    <option {if $data['user_privacy_birthdate'] == "me"}selected{/if} value="me">
                      {__("Just Me")}
                    </option>
                  </select>
                </div>
              </div>

              <div class="form-group col-md-6">
                <label class="form-label">{__("Who can see your")} {__("basic info")}</label>
                <div class="input-group">
                  <span class="input-group-text"><i class="fas fa-user"></i></span>
                  <select class="form-select" name="user_privacy_basic">
                    <option {if $data['user_privacy_basic'] == "public"}selected{/if} value="public">
                      {__("Everyone")}
                    </option>
                    <option {if $data['user_privacy_basic'] == "friends"}selected{/if} value="friends">
                      {if $system['friends_enabled']}{__("Friends")}{else}{__("Followers")}{/if}
                    </option>
                    <option {if $data['user_privacy_basic'] == "me"}selected{/if} value="me">
                      {__("Just Me")}
                    </option>
                  </select>
                </div>
              </div>

              {if $system['work_info_enabled']}
                <div class="form-group col-md-6">
                  <label class="form-label">{__("Who can see your")} {__("work info")}</label>
                  <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-briefcase"></i></span>
                    <select class="form-select" name="user_privacy_work">
                      <option {if $data['user_privacy_work'] == "public"}selected{/if} value="public">
                        {__("Everyone")}
                      </option>
                      <option {if $data['user_privacy_work'] == "friends"}selected{/if} value="friends">
                        {if $system['friends_enabled']}{__("Friends")}{else}{__("Followers")}{/if}
                      </option>
                      <option {if $data['user_privacy_work'] == "me"}selected{/if} value="me">
                        {__("Just Me")}
                      </option>
                    </select>
                  </div>
                </div>
              {/if}

              {if $system['location_info_enabled']}
                <div class="form-group col-md-6">
                  <label class="form-label">{__("Who can see your")} {__("location info")}</label>
                  <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-map-marker-alt"></i></span>
                    <select class="form-select" name="user_privacy_location">
                      <option {if $data['user_privacy_location'] == "public"}selected{/if} value="public">
                        {__("Everyone")}
                      </option>
                      <option {if $data['user_privacy_location'] == "friends"}selected{/if} value="friends">
                        {if $system['friends_enabled']}{__("Friends")}{else}{__("Followers")}{/if}
                      </option>
                      <option {if $data['user_privacy_location'] == "me"}selected{/if} value="me">
                        {__("Just Me")}
                      </option>
                    </select>
                  </div>
                </div>
              {/if}

              {if $system['education_info_enabled']}
                <div class="form-group col-md-6">
                  <label class="form-label">{__("Who can see your")} {__("education info")}</label>
                  <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-university"></i></span>
                    <select class="form-select" name="user_privacy_education">
                      <option {if $data['user_privacy_education'] == "public"}selected{/if} value="public">
                        {__("Everyone")}
                      </option>
                      <option {if $data['user_privacy_education'] == "friends"}selected{/if} value="friends">
                        {if $system['friends_enabled']}{__("Friends")}{else}{__("Followers")}{/if}
                      </option>
                      <option {if $data['user_privacy_education'] == "me"}selected{/if} value="me">
                        {__("Just Me")}
                      </option>
                    </select>
                  </div>
                </div>
              {/if}

              <div class="form-group col-md-6">
                <label class="form-label">{__("Who can see your")} {__("other info")}</label>
                <div class="input-group">
                  <span class="input-group-text"><i class="fas fa-folder-plus"></i></span>
                  <select class="form-select" name="user_privacy_other">
                    <option {if $data['user_privacy_other'] == "public"}selected{/if} value="public">
                      {__("Everyone")}
                    </option>
                    <option {if $data['user_privacy_other'] == "friends"}selected{/if} value="friends">
                      {if $system['friends_enabled']}{__("Friends")}{else}{__("Followers")}{/if}
                    </option>
                    <option {if $data['user_privacy_other'] == "me"}selected{/if} value="me">
                      {__("Just Me")}
                    </option>
                  </select>
                </div>
              </div>

              {if $system['friends_enabled']}
                <div class="form-group col-md-6">
                  <label class="form-label">{__("Who can see your")} {__("friends")}</label>
                  <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-user-friends"></i></span>
                    <select class="form-select" name="user_privacy_friends">
                      <option {if $data['user_privacy_friends'] == "public"}selected{/if} value="public">
                        {__("Everyone")}
                      </option>
                      <option {if $data['user_privacy_friends'] == "friends"}selected{/if} value="friends">
                        {__("Friends")}
                      </option>
                      <option {if $data['user_privacy_friends'] == "me"}selected{/if} value="me">
                        {__("Just Me")}
                      </option>
                    </select>
                  </div>
                </div>
              {/if}

              <div class="form-group col-md-6">
                <label class="form-label">{__("Who can see your")} {__("followers/followings")}</label>
                <div class="input-group">
                  <span class="input-group-text"><i class="fas fa-user-friends"></i></span>
                  <select class="form-select" name="user_privacy_followers">
                    <option {if $data['user_privacy_followers'] == "public"}selected{/if} value="public">
                      {__("Everyone")}
                    </option>
                    <option {if $data['user_privacy_followers'] == "friends"}selected{/if} value="friends">
                      {if $system['friends_enabled']}{__("Friends")}{else}{__("Followers")}{/if}
                    </option>
                    <option {if $data['user_privacy_followers'] == "me"}selected{/if} value="me">
                      {__("Just Me")}
                    </option>
                  </select>
                </div>
              </div>

              {if $system['monetization_enabled']}
                <div class="form-group col-md-6">
                  <label class="form-label">{__("Who can see your")} {__("subscriptions")}</label>
                  <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-user-friends"></i></span>
                    <select class="form-select" name="user_privacy_subscriptions">
                      <option {if $data['user_privacy_subscriptions'] == "public"}selected{/if} value="public">
                        {__("Everyone")}
                      </option>
                      <option {if $data['user_privacy_subscriptions'] == "friends"}selected{/if} value="friends">
                        {if $system['friends_enabled']}{__("Friends")}{else}{__("Followers")}{/if}
                      </option>
                      <option {if $data['user_privacy_subscriptions'] == "me"}selected{/if} value="me">
                        {__("Just Me")}
                      </option>
                    </select>
                  </div>
                </div>
              {/if}

              <div class="form-group col-md-6">
                <label class="form-label">{__("Who can see your")} {__("photos")}</label>
                <div class="input-group">
                  <span class="input-group-text"><i class="fas fa-images"></i></span>
                  <select class="form-select" name="user_privacy_photos">
                    <option {if $data['user_privacy_photos'] == "public"}selected{/if} value="public">
                      {__("Everyone")}
                    </option>
                    <option {if $data['user_privacy_photos'] == "friends"}selected{/if} value="friends">
                      {if $system['friends_enabled']}{__("Friends")}{else}{__("Followers")}{/if}
                    </option>
                    <option {if $data['user_privacy_photos'] == "me"}selected{/if} value="me">
                      {__("Just Me")}
                    </option>
                  </select>
                </div>
              </div>

              {if $system['pages_enabled']}
                <div class="form-group col-md-6">
                  <label class="form-label">{__("Who can see your")} {__("liked pages")}</label>
                  <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-flag"></i></span>
                    <select class="form-select" name="user_privacy_pages">
                      <option {if $data['user_privacy_pages'] == "public"}selected{/if} value="public">
                        {__("Everyone")}
                      </option>
                      <option {if $data['user_privacy_pages'] == "friends"}selected{/if} value="friends">
                        {if $system['friends_enabled']}{__("Friends")}{else}{__("Followers")}{/if}
                      </option>
                      <option {if $data['user_privacy_pages'] == "me"}selected{/if} value="me">
                        {__("Just Me")}
                      </option>
                    </select>
                  </div>
                </div>
              {/if}

              {if $system['groups_enabled']}
                <div class="form-group col-md-6">
                  <label class="form-label">{__("Who can see your")} {__("joined groups")}</label>
                  <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-users"></i></span>
                    <select class="form-select" name="user_privacy_groups">
                      <option {if $data['user_privacy_groups'] == "public"}selected{/if} value="public">
                        {__("Everyone")}
                      </option>
                      <option {if $data['user_privacy_groups'] == "friends"}selected{/if} value="friends">
                        {if $system['friends_enabled']}{__("Friends")}{else}{__("Followers")}{/if}
                      </option>
                      <option {if $data['user_privacy_groups'] == "me"}selected{/if} value="me">
                        {__("Just Me")}
                      </option>
                    </select>
                  </div>
                </div>
              {/if}

              {if $system['events_enabled']}
                <div class="form-group col-md-6">
                  <label class="form-label">{__("Who can see your")} {__("joined events")}</label>
                  <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-calendar"></i></span>
                    <select class="form-select" name="user_privacy_events">
                      <option {if $data['user_privacy_events'] == "public"}selected{/if} value="public">
                        {__("Everyone")}
                      </option>
                      <option {if $data['user_privacy_events'] == "friends"}selected{/if} value="friends">
                        {if $system['friends_enabled']}{__("Friends")}{else}{__("Followers")}{/if}
                      </option>
                      <option {if $data['user_privacy_events'] == "me"}selected{/if} value="me">
                        {__("Just Me")}
                      </option>
                    </select>
                  </div>
                </div>
              {/if}
            </div>

            <!-- success -->
            <div class="alert alert-success x-hidden"></div>
            <!-- success -->

            <!-- error -->
            <div class="alert alert-danger x-hidden"></div>
            <!-- error -->

            <div class="card-footer-fake text-end">
              <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
            </div>
          </form>
        </div>
        <!-- privacy tab -->

        <!-- security tab -->
        <div class="tab-pane" id="security">
          <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover js_dataTable" style="width: 100%!important;">
              <thead>
                <tr>
                  <th>{__("ID")}</th>
                  <th>{__("Browser")}</th>
                  <th>{__("OS")}</th>
                  <th>{__("Date")}</th>
                  <th>{__("IP")}</th>
                  <th>{__("Actions")}</th>
                </tr>
              </thead>
              <tbody>
                {if !$user->_data['user_demo'] && $data['sessions']}
                  {foreach $data['sessions'] as $session}
                    <tr>
                      <td>{$session@iteration}</td>
                      <td>{$session['user_browser']}</td>
                      <td>{$session['user_os']}</td>
                      <td>
                        <span class="js_moment" data-time="{$session['session_date']}">{$session['session_date']}</span>
                      </td>
                      <td>{$session['user_ip']}</td>
                      <td>
                        <button data-bs-toggle="tooltip" title='{__("End Session")}' class="btn btn-sm btn-icon btn-rounded btn-danger js_admin-deleter" data-handle="session" data-id="{$session['session_id']}">
                          <i class="fa fa-trash-alt"></i>
                        </button>
                      </td>
                    </tr>
                  {/foreach}
                {/if}
              </tbody>
            </table>
          </div>
        </div>
        <!-- security tab -->

        <!-- membership tab -->
        <div class="tab-pane" id="membership">
          <form class="js_ajax-forms" data-url="admin/users.php?id={$data['user_id']}&do=edit_membership">
            {if $data['user_subscribed']}
              <div class="heading-small mb20">
                {__("Package Details")}
              </div>
              <div class="pl-md-4">
                <div class="row form-group">
                  <label class="col-md-3 form-label">
                    {__("Package")}
                  </label>
                  <div class="col-md-9">
                    <p class="form-control-plaintext">
                      {$data['name']} ({print_money($data['price'])}
                      {if $data['period'] == "life"}{__("Life Time")}{else}{__("per")} {if $data['period_num'] != '1'}{$data['period_num']}{/if} {__($data['period']|ucfirst)}{/if})
                    </p>
                  </div>
                </div>

                <div class="row form-group">
                  <label class="col-md-3 form-label">
                    {__("Subscription Date")}
                  </label>
                  <div class="col-md-9">
                    <p class="form-control-plaintext">
                      {$data['user_subscription_date']|date_format:"%e %B %Y"}
                    </p>
                  </div>
                </div>

                <div class="row form-group">
                  <label class="col-md-3 form-label">
                    {__("Expiration Date")}
                  </label>
                  <div class="col-md-9">
                    <p class="form-control-plaintext">
                      {if $data['period'] == "life"}
                        {__("Life Time")}
                      {else}
                        {$data['subscription_end']|date_format:"%e %B %Y"} ({if $data['subscription_timeleft'] > 0}{__("Remaining")} {$data['subscription_timeleft']} {__("Days")}{else}{__("Expired")}{/if})
                      {/if}
                    </p>
                  </div>
                </div>

                <div class="row form-group">
                  <label class="col-md-3 form-label">
                    {__("Boosted Posts")}
                  </label>
                  <div class="col-md-9">
                    <p class="form-control-plaintext">
                      {$data['user_boosted_posts']}/{$data['boost_posts']}
                    </p>

                    <div class="progress mb5">
                      <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="{if $data['boost_posts'] == 0}0{else}{($data['user_boosted_posts']/$data['boost_posts'])*100}{/if}" aria-valuemin="0" aria-valuemax="100" style="width: {if $data['boost_posts'] == 0}0{else}{($data['user_boosted_posts']/$data['boost_posts'])*100}{/if}%"></div>
                    </div>
                  </div>
                </div>

                <div class="row form-group">
                  <label class="col-md-3 form-label">
                    {__("Boosted Pages")}
                  </label>
                  <div class="col-md-9">
                    <p class="form-control-plaintext">
                      {$data['user_boosted_pages']}/{$data['boost_pages']}
                    </p>

                    <div class="progress mb5">
                      <div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar" aria-valuenow="{if $data['boost_pages'] == 0}0{else}{($data['user_boosted_pages']/$data['boost_pages'])*100}{/if}" aria-valuemin="0" aria-valuemax="100" style="width: {if $data['boost_pages'] == 0}0{else}{($data['user_boosted_pages']/$data['boost_pages'])*100}{/if}%"></div>
                    </div>
                  </div>
                </div>

                <div class="row">
                  <div class="col-md-9 offset-md-3">
                    <button type="button" class="btn btn-danger js_admin-deleter" data-handle="user_package" data-id="{$data['user_id']}">
                      <i class="fa fa-trash-alt mr10"></i>{__("Unsubscribe")}
                    </button>
                  </div>
                </div>
              </div>

              <div class="divider"></div>
            {/if}

            <div class="heading-small mb20">
              {__("Upgrade Package")}
            </div>
            <div class="pl-md-4">
              <div class="row form-group">
                <label class="col-md-3 form-label">
                  {__("Select Package")}
                </label>
                <div class="col-md-9">
                  <select class="form-select" name="package">
                    {foreach $packages as $package}
                      <option value="{$package['package_id']}" {if $data['user_package'] == $package['package_id']}selected{/if}>
                        {$package['name']} ({print_money($package['price'])}
                        {if $package['period'] == "life"}{__("Life Time")}{else}{__("per")} {if $package['period_num'] != '1'}{$package['period_num']}{/if} {__($package['period']|ucfirst)}{/if})
                      </option>
                    {/foreach}
                  </select>
                </div>
              </div>
            </div>

            <!-- success -->
            <div class="alert alert-success mb0 mt20 x-hidden"></div>
            <!-- success -->

            <!-- error -->
            <div class="alert alert-danger mb0 mt20 x-hidden"></div>
            <!-- error -->

            <div class="card-footer-fake text-end">
              <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
            </div>
          </form>
        </div>
        <!-- membership tab -->

        <!-- extra tab -->
        <div class="tab-pane" id="extra">
          <form class="js_ajax-forms" data-url="admin/users.php?id={$data['user_id']}&do=edit_extra">
            <!-- Affiliates -->
            {if $system['affiliates_enabled']}
              <div class="heading-small mb20">
                {__("Affiliates")}
              </div>
              <div class="pl-md-4">
                <div class="form-table-row">
                  <div class="avatar">
                    {include file='__svg_icons.tpl' icon="affiliates" class="main-icon" width="40px" height="40px"}
                  </div>
                  <div>
                    <div class="form-label h6">{__("Custom Affiliates System")}</div>
                    <div class="form-text d-none d-sm-block">{__("Enable it to override the default affiliates system")}</div>
                  </div>
                  <div class="text-end">
                    <label class="switch" for="custom_affiliates_system">
                      <input type="checkbox" name="custom_affiliates_system" id="custom_affiliates_system" {if $data['custom_affiliates_system']}checked{/if}>
                      <span class="slider round"></span>
                    </label>
                  </div>
                </div>

                {include file='_affiliates_levels.tpl' _affiliate=$data}
              </div>

              <div class="divider"></div>
            {/if}
            <!-- Affiliates -->

            <!-- Points -->
            {if $system['points_enabled']}
              <div class="heading-small mb20">
                {__("Points")}
              </div>
              <div class="pl-md-4">
                <div class="row">
                  <label class="col-md-3 form-label">
                    {__("Points Balance")}
                  </label>
                  <div class="col-md-9">
                    <div class="input-group">
                      <span class="input-group-text"><i class="fa fa-piggy-bank"></i></span>
                      <input class="form-control" name="user_points" value="{$data['user_points']}">
                    </div>
                  </div>
                </div>
              </div>

              <div class="divider"></div>
            {/if}
            <!-- Points -->

            <!-- Wallet -->
            {if $system['wallet_enabled']}
              <div class="heading-small mb20">
                {__("Wallet")}
              </div>
              <div class="pl-md-4">
                <div class="row">
                  <label class="col-md-3 form-label">
                    {__("Wallet Balance")}
                  </label>
                  <div class="col-md-9">
                    <div class="input-group">
                      {if $system['system_currency_dir'] == "left"}
                        <span class="input-group-text">{$system['system_currency_symbol']}</span>
                      {/if}
                      <input type="text" class="form-control" placeholder="0.00" min="1.00" max="1000" name="user_wallet_balance" value="{$data['user_wallet_balance']}">
                      {if $system['system_currency_dir'] == "right"}
                        <span class="input-group-text">{$system['system_currency_symbol']}</span>
                      {/if}
                    </div>
                  </div>
                </div>
              </div>

              <div class="divider"></div>
            {/if}
            <!-- Wallet -->

            <!-- Marketplace -->
            {if $system['market_enabled']}
              <div class="heading-small mb20">
                {__("Marketplace")}
              </div>
              <div class="pl-md-4">
                <div class="row">
                  <label class="col-md-3 form-label">
                    {__("Marketplace Balance")}
                  </label>
                  <div class="col-md-9">
                    <h6>
                      <span class="badge badge-lg bg-light text-primary">
                        {print_money($data['user_market_balance']|number_format:2)}
                      </span>
                    </h6>
                  </div>
                </div>
              </div>

              <div class="divider"></div>
            {/if}
            <!-- Marketplace -->

            <!-- Funding -->
            {if $system['funding_enabled']}
              <div class="heading-small mb20">
                {__("Funding")}
              </div>
              <div class="pl-md-4">
                <div class="row">
                  <label class="col-md-3 form-label">
                    {__("Funding Balance")}
                  </label>
                  <div class="col-md-9">
                    <h6>
                      <span class="badge badge-lg bg-light text-primary">
                        {print_money($data['user_funding_balance']|number_format:2)}
                      </span>
                    </h6>
                  </div>
                </div>
              </div>

              <div class="divider"></div>
            {/if}
            <!-- Funding -->

            <!-- Monetization -->
            {if $system['monetization_enabled']}
              <div class="heading-small mb20">
                {__("Monetization")}
              </div>
              {if $data['can_monetize_content']}
                <div class="pl-md-4">
                  <div class="form-table-row">
                    <div class="avatar">
                      {include file='__svg_icons.tpl' icon="monetization" class="main-icon" width="40px" height="40px"}
                    </div>
                    <div>
                      <div class="form-label h6">{__("Monetization")}</div>
                      <div class="form-text d-none d-sm-block">{__("Enable or disable monetization for your content")}</div>
                    </div>
                    <div class="text-end">
                      <label class="switch" for="user_monetization_enabled">
                        <input type="checkbox" name="user_monetization_enabled" id="user_monetization_enabled" {if $data['user_monetization_enabled']}checked{/if}>
                        <span class="slider round"></span>
                      </label>
                    </div>
                  </div>

                  <div class="row mb30">
                    <label class="col-md-3 form-label">
                      {__("Payment Plans")}
                    </label>
                    <div class="col-md-9">
                      <div class="payment-plans">
                        {foreach $monetization_plans as $plan}
                          <div class="payment-plan">
                            <div class="text-xxlg">{__($plan['title'])}</div>
                            <div class="text-xlg">{print_money($plan['price'])} / {if $plan['period_num'] != '1'}{$plan['period_num']}{/if} {__($plan['period']|ucfirst)}</div>
                            {if {$plan['custom_description']}}
                              <div>{$plan['custom_description']}</div>
                            {/if}
                            <div class="mt10">
                              <span class="text-link mr10 js_monetization-deleter" data-id="{$plan['plan_id']}">
                                <i class="fa fa-trash-alt mr5"></i>{__("Delete")}
                              </span>
                              |
                              <span data-toggle="modal" data-url="monetization/controller.php?do=edit&id={$plan['plan_id']}" class="text-link ml10">
                                <i class="fa fa-pen mr5"></i>{__("Edit")}
                              </span>
                            </div>
                          </div>
                        {/foreach}
                        <div data-toggle="modal" data-url="monetization/controller.php?do=add&node_id={$data['user_id']}&node_type=profile" class="payment-plan new">{__("Add new plan")} </div>
                      </div>
                    </div>
                  </div>

                  <div class="row">
                    <label class="col-md-3 form-label">
                      {__("Monetization Balance")}
                    </label>
                    <div class="col-md-9">
                      <h6>
                        <span class="badge badge-lg bg-light text-primary">
                          {print_money($data['user_monetization_balance']|number_format:2)}
                        </span>
                      </h6>
                    </div>
                  </div>
                </div>
              {else}
                <div class="pl-md-4">
                  <div class="alert alert-danger">
                    <div class="icon">
                      <i class="fa fa-minus-circle fa-2x"></i>
                    </div>
                    <div class="text pt5">
                      {__("This user is not eligible for monetization")}
                    </div>
                  </div>
                </div>
              {/if}
            {/if}
            <!-- Monetization -->

            <!-- success -->
            <div class="alert alert-success mb0 mt20 x-hidden"></div>
            <!-- success -->

            <!-- error -->
            <div class="alert alert-danger mb0 mt20 x-hidden"></div>
            <!-- error -->

            <div class="card-footer-fake text-end">
              <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
            </div>
          </form>
        </div>
        <!-- extra tab -->
      </div>
      <!-- tabs content -->
    </div>

  {/if}
</div>