{include file='_head.tpl'}
{include file='_header.tpl'}

<!-- page content -->
<div class="{if $system['fluid_design']}container-fluid{else}container{/if} mt20 sg-offcanvas">
  <div class="row">

    <!-- left panel -->
    <div class="col-md-4 col-lg-3 sg-offcanvas-sidebar admin-sidebar">

      <!-- System -->
      <div class="card mb15">
        <div class="card-header block-title">
          {__("System")}
        </div>
        <div class="card-body with-nav">
          <ul class="side-nav">
            <!-- Dashboard -->
            <li {if $view == "dashboard"}class="active" {/if}>
              <a href="{$system['system_url']}/{$control_panel['url']}">
                <i class="fa fa-tachometer-alt fa-lg fa-fw mr10" style="color: #5e72e4"></i>{__("Dashboard")}
              </a>
            </li>
            <!-- Dashboard -->

            {if $user->_is_admin}
              <!-- Settings -->
              <li {if $view == "settings"}class="active" {/if}>
                <a href="#settings" data-bs-toggle="collapse" {if $view == "settings"}aria-expanded="true" {/if}>
                  <i class="fa fa-cog fa-lg fa-fw mr10" style="color: #5e72e4"></i>{__("Settings")}
                </a>
                <div class='collapse {if $view == "settings"}show{/if}' id="settings">
                  <ul>
                    <li {if $view == "settings" && $sub_view == ""}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/settings">
                        <i class="fa fa-cogs fa-lg fa-fw mr10"></i>{__("System Settings")}
                      </a>
                    </li>
                    <li {if $view == "settings" && $sub_view == "posts"}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/settings/posts">
                        <i class="fa fa-comment-alt fa-lg fa-fw mr10"></i>{__("Posts Settings")}
                      </a>
                    </li>
                    <li {if $view == "settings" && $sub_view == "registration"}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/settings/registration">
                        <i class="fa fa-sign-in-alt fa-lg fa-fw mr10"></i>{__("Registration Settings")}
                      </a>
                    </li>
                    <li {if $view == "settings" && $sub_view == "accounts"}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/settings/accounts">
                        <i class="fa fa-users-cog fa-lg fa-fw mr10"></i>{__("Accounts Settings")}
                      </a>
                    </li>
                    <li {if $view == "settings" && $sub_view == "email"}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/settings/email">
                        <i class="fa fa-envelope-open fa-lg fa-fw mr10"></i>{__("Email Settings")}
                      </a>
                    </li>
                    <li {if $view == "settings" && $sub_view == "sms"}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/settings/sms">
                        <i class="fa fa-mobile fa-lg fa-fw mr10"></i>{__("SMS Settings")}
                      </a>
                    </li>
                    <li {if $view == "settings" && $sub_view == "notifications"}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/settings/notifications">
                        <i class="fa fa-bell fa-lg fa-fw mr10"></i>{__("Notifications Settings")}
                      </a>
                    </li>
                    <li {if $view == "settings" && $sub_view == "chat"}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/settings/chat">
                        <i class="fa fa-comments fa-lg fa-fw mr10"></i>{__("Chat Settings")}
                      </a>
                    </li>
                    <li {if $view == "settings" && $sub_view == "live"}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/settings/live">
                        <i class="fa fa-signal fa-lg fa-fw mr10"></i>{__("Live Stream Settings")}
                      </a>
                    </li>
                    <li {if $view == "settings" && $sub_view == "uploads"}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/settings/uploads">
                        <i class="fa fa-upload fa-lg fa-fw mr10"></i>{__("Uploads Settings")}
                      </a>
                    </li>
                    <li {if $view == "settings" && $sub_view == "payments"}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/settings/payments">
                        <i class="fa fa-credit-card fa-lg fa-fw mr10"></i>{__("Payments Settings")}
                      </a>
                    </li>
                    <li {if $view == "settings" && $sub_view == "security"}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/settings/security">
                        <i class="fa fa-shield-alt fa-lg fa-fw mr10"></i>{__("Security Settings")}
                      </a>
                    </li>
                    <li {if $view == "settings" && $sub_view == "limits"}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/settings/limits">
                        <i class="fa fa-tachometer-alt fa-lg fa-fw mr10"></i>{__("Limits Settings")}
                      </a>
                    </li>
                    <li {if $view == "settings" && $sub_view == "analytics"}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/settings/analytics">
                        <i class="fa fa-chart-pie fa-lg fa-fw mr10"></i>{__("Analytics Settings")}
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
              <!-- Settings -->

              <!-- Themes -->
              <li {if $view == "themes"}class="active" {/if}>
                <a href="{$system['system_url']}/{$control_panel['url']}/themes">
                  <i class="fa fa-desktop fa-lg fa-fw mr10" style="color: #5e72e4"></i>{__("Themes")}
                </a>
              </li>
              <!-- Themes -->

              <!-- Design -->
              <li {if $view == "design"}class="active" {/if}>
                <a href="{$system['system_url']}/{$control_panel['url']}/design">
                  <i class="fa fa-paint-brush fa-lg fa-fw mr10" style="color: #5e72e4"></i>{__("Design")}
                </a>
              </li>
              <!-- Design -->

              <!-- Languages -->
              <li {if $view == "languages"}class="active" {/if}>
                <a href="{$system['system_url']}/{$control_panel['url']}/languages">
                  <i class="fa fa-language fa-lg fa-fw mr10" style="color: #5e72e4"></i>{__("Languages")}
                </a>
              </li>
              <!-- Languages -->

              <!-- Countries -->
              <li {if $view == "countries"}class="active" {/if}>
                <a href="{$system['system_url']}/{$control_panel['url']}/countries">
                  <i class="fa fa-globe fa-lg fa-fw mr10" style="color: #5e72e4"></i>{__("Countries")}
                </a>
              </li>
              <!-- Countries -->

              <!-- Currencies -->
              <li {if $view == "currencies"}class="active" {/if}>
                <a href="{$system['system_url']}/{$control_panel['url']}/currencies">
                  <i class="fa fa-money-bill-alt fa-lg fa-fw mr10" style="color: #5e72e4"></i>{__("Currencies")}
                </a>
              </li>
              <!-- Currencies -->

              <!-- Genders -->
              <li {if $view == "genders"}class="active" {/if}>
                <a href="{$system['system_url']}/{$control_panel['url']}/genders">
                  <i class="fa fa-venus-mars fa-lg fa-fw mr10" style="color: #5e72e4"></i>{__("Genders")}
                </a>
              </li>
              <!-- Genders -->
            {/if}
          </ul>
        </div>
      </div>
      <!-- System -->

      <!-- Users -->
      {if $user->_is_admin || ($user->_is_moderator && $system['mods_users_permission'])}
        <div class="card mb15">
          <div class="card-header block-title">
            {__("Users")}
          </div>
          <div class="card-body with-nav">
            <ul class="side-nav">
              <!-- Users -->
              <li {if $view == "users"}class="active" {/if}>
                <a href="#users" data-bs-toggle="collapse" {if $view == "users"}aria-expanded="true" {/if}>
                  <i class="fa fa-user fa-lg fa-fw mr10" style="color: #9C27B0"></i>{__("Users")}
                </a>
                <div class='collapse {if $view == "users"}show{/if}' id="users">
                  <ul>
                    <li {if $view == "users" && $sub_view == ""}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/users">
                        {__("List Users")}
                      </a>
                    </li>
                    <li {if $view == "users" && $sub_view == "moderators"}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/users/moderators">
                        {__("List Moderators")}
                      </a>
                    </li>
                    <li {if $view == "users" && $sub_view == "admins"}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/users/admins">
                        {__("List Admins")}
                      </a>
                    </li>
                    <li {if $view == "users" && $sub_view == "online"}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/users/online">
                        {__("List Online")}
                      </a>
                    </li>
                    <li {if $view == "users" && $sub_view == "banned"}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/users/banned">
                        {__("List Banned")}
                      </a>
                    </li>
                    <li {if $view == "users" && $sub_view == "not_activated"}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/users/not_activated">
                        {__("List Not Activated")}
                      </a>
                    </li>
                    <li {if $view == "users" && $sub_view == "pending"}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/users/pending">
                        {__("List Pending")}
                      </a>
                    </li>
                    <li {if $view == "users" && $sub_view == "stats"}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/users/stats">
                        {__("List Users Stats")}
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
              <!-- Users -->

              {if $user->_is_admin}
                <!-- Users Groups -->
                <li {if $view == "users_groups"}class="active" {/if}>
                  <a href="{$system['system_url']}/{$control_panel['url']}/users_groups">
                    <i class="fa fa-users fa-lg fa-fw mr10" style="color: #9C27B0"></i>{__("Users Groups")}
                  </a>
                </li>
                <!-- Users Groups -->
              {/if}

              {if $user->_is_admin}
                <!-- Permissions Groups -->
                <li {if $view == "permissions_groups"}class="active" {/if}>
                  <a href="{$system['system_url']}/{$control_panel['url']}/permissions_groups">
                    <i class="fa fa-key fa-lg fa-fw mr10" style="color: #9C27B0"></i>{__("Permissions Groups")}
                  </a>
                </li>
                <!-- Permissions Groups -->
              {/if}
            </ul>
          </div>
        </div>
        <!-- Users -->
      {/if}

      <!-- Modules -->
      <div class="card mb15">
        <div class="card-header block-title">
          {__("Modules")}
        </div>
        <div class="card-body with-nav">
          <ul class="side-nav">

            <!-- Posts -->
            {if $user->_is_admin || ($user->_is_moderator && $system['mods_posts_permission'])}
              <li {if $view == "posts"}class="active" {/if}>
                <a href="#posts" data-bs-toggle="collapse" {if $view == "posts"}aria-expanded="true" {/if}>
                  <i class="fa fa-newspaper fa-lg fa-fw mr10" style="color: #F44336"></i>{__("Posts")}
                </a>
                <div class='collapse {if $view == "posts"}show{/if}' id="posts">
                  <ul>
                    <li {if $view == "posts" && $sub_view == ""}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/posts">
                        {__("List Posts")}
                      </a>
                    </li>
                    <li {if $view == "posts" && $sub_view == "pending"}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/posts/pending">
                        {__("List Pending Posts")}
                      </a>
                    </li>
                    <li {if $view == "posts" && $sub_view == "videos_categories"}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/posts/videos_categories">
                        {__("List Videos Categories")}
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
            {/if}
            <!-- Posts -->

            <!-- Pages -->
            {if $user->_is_admin || ($user->_is_moderator && $system['mods_pages_permission'])}
              <li {if $view == "pages"}class="active" {/if}>
                <a href="#pages" data-bs-toggle="collapse" {if $view == "pages"}aria-expanded="true" {/if}>
                  <i class="fa fa-flag fa-lg fa-fw mr10" style="color: #F44336"></i>{__("Pages")}
                </a>
                <div class='collapse {if $view == "pages"}show{/if}' id="pages">
                  <ul>
                    <li {if $view == "pages" && $sub_view == ""}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/pages">
                        {__("List Pages")}
                      </a>
                    </li>
                    <li {if $view == "pages" && $sub_view == "categories"}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/pages/categories">
                        {__("List Categories")}
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
            {/if}
            <!-- Pages -->

            <!-- Groups -->
            {if $user->_is_admin || ($user->_is_moderator && $system['mods_groups_permission'])}
              <li {if $view == "groups"}class="active" {/if}>
                <a href="#groups" data-bs-toggle="collapse" {if $view == "groups"}aria-expanded="true" {/if}>
                  <i class="fa fa-users fa-lg fa-fw mr10" style="color: #F44336"></i>{__("Groups")}
                </a>
                <div class='collapse {if $view == "groups"}show{/if}' id="groups">
                  <ul>
                    <li {if $view == "groups" && $sub_view == ""}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/groups">
                        {__("List Groups")}
                      </a>
                    </li>
                    <li {if $view == "groups" && $sub_view == "categories"}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/groups/categories">
                        {__("List Categories")}
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
            {/if}
            <!-- Groups -->

            <!-- Events -->
            {if $user->_is_admin || ($user->_is_moderator && $system['mods_events_permission'])}
              <li {if $view == "events"}class="active" {/if}>
                <a href="#events" data-bs-toggle="collapse" {if $view == "events"}aria-expanded="true" {/if}>
                  <i class="fa fa-calendar fa-lg fa-fw mr10" style="color: #F44336"></i>{__("Events")}
                </a>
                <div class='collapse {if $view == "events"}show{/if}' id="events">
                  <ul>
                    <li {if $view == "events" && $sub_view == ""}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/events">
                        {__("List Events")}
                      </a>
                    </li>
                    <li {if $view == "events" && $sub_view == "categories"}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/events/categories">
                        {__("List Categories")}
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
            {/if}
            <!-- Events -->

            <!-- Blogs -->
            {if $user->_is_admin || ($user->_is_moderator && $system['mods_blogs_permission'])}
              <li {if $view == "blogs"}class="active" {/if}>
                <a href="#blogs" data-bs-toggle="collapse" {if $view == "blogs"}aria-expanded="true" {/if}>
                  <i class="fab fa-blogger-b fa-lg fa-fw mr10" style="color: #F44336"></i>{__("Blogs")}
                </a>
                <div class='collapse {if $view == "blogs"}show{/if}' id="blogs">
                  <ul>
                    <li {if $view == "blogs" && $sub_view == ""}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/blogs">
                        {__("List Blogs")}
                      </a>
                    </li>
                    <li {if $view == "blogs" && $sub_view == "categories"}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/blogs/categories">
                        {__("List Categories")}
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
            {/if}
            <!-- Blogs -->

            <!-- Offers -->
            {if $user->_is_admin || ($user->_is_moderator && $system['mods_offers_permission'])}
              <li {if $view == "offers"}class="active" {/if}>
                <a href="#offers" data-bs-toggle="collapse" {if $view == "offers"}aria-expanded="true" {/if}>
                  <i class="fa fa-tag fa-lg fa-fw mr10" style="color: #F44336"></i>{__("Offers")}
                </a>
                <div class='collapse {if $view == "offers"}show{/if}' id="offers">
                  <ul>
                    <li {if $view == "offers" && $sub_view == ""}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/offers">
                        {__("List Offers")}
                      </a>
                    </li>
                    <li {if $view == "offers" && $sub_view == "categories"}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/offers/categories">
                        {__("List Categories")}
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
            {/if}
            <!-- Offers -->

            <!-- Jobs -->
            {if $user->_is_admin || ($user->_is_moderator && $system['mods_jobs_permission'])}
              <li {if $view == "jobs"}class="active" {/if}>
                <a href="#jobs" data-bs-toggle="collapse" {if $view == "jobs"}aria-expanded="true" {/if}>
                  <i class="fa fa-briefcase fa-lg fa-fw mr10" style="color: #F44336"></i>{__("Jobs")}
                </a>
                <div class='collapse {if $view == "jobs"}show{/if}' id="jobs">
                  <ul>
                    <li {if $view == "jobs" && $sub_view == ""}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/jobs">
                        {__("List Jobs")}
                      </a>
                    </li>
                    <li {if $view == "jobs" && $sub_view == "categories"}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/jobs/categories">
                        {__("List Categories")}
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
            {/if}
            <!-- Jobs -->

            <!-- Courses -->
            {if $user->_is_admin || ($user->_is_moderator && $system['mods_courses_permission'])}
              <li {if $view == "courses"}class="active" {/if}>
                <a href="#courses" data-bs-toggle="collapse" {if $view == "courses"}aria-expanded="true" {/if}>
                  <i class="fa fa-book fa-lg fa-fw mr10" style="color: #F44336"></i>{__("Courses")}
                </a>
                <div class='collapse {if $view == "courses"}show{/if}' id="courses">
                  <ul>
                    <li {if $view == "courses" && $sub_view == ""}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/courses">
                        {__("List Courses")}
                      </a>
                    </li>
                    <li {if $view == "courses" && $sub_view == "categories"}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/courses/categories">
                        {__("List Categories")}
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
            {/if}
            <!-- Courses -->

            <!-- Forums -->
            {if $user->_is_admin || ($user->_is_moderator && $system['mods_forums_permission'])}
              <li {if $view == "forums"}class="active" {/if}>
                <a href="#forums" data-bs-toggle="collapse" {if $view == "forums"}aria-expanded="true" {/if}>
                  <i class="fa fa-comments fa-lg fa-fw mr10" style="color: #F44336"></i>{__("Forums")}
                </a>
                <div class='collapse {if $view == "forums"}show{/if}' id="forums">
                  <ul>
                    <li {if $view == "forums" && $sub_view == ""}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/forums">
                        {__("List Forums")}
                      </a>
                    </li>
                    <li {if $view == "forums" && $sub_view == "threads"}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/forums/threads">
                        {__("List Threads")}
                      </a>
                    </li>
                    <li {if $view == "forums" && $sub_view == "replies"}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/forums/replies">
                        {__("List Replies")}
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
            {/if}
            <!-- Forums -->

            <!-- Movies -->
            {if $user->_is_admin || ($user->_is_moderator && $system['mods_movies_permission'])}
              <li {if $view == "movies"}class="active" {/if}>
                <a href="#movies" data-bs-toggle="collapse" {if $view == "movies"}aria-expanded="true" {/if}>
                  <i class="fa fa-film fa-lg fa-fw mr10" style="color: #F44336"></i>{__("Movies")}
                </a>
                <div class='collapse {if $view == "movies"}show{/if}' id="movies">
                  <ul>
                    <li {if $view == "movies" && $sub_view == ""}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/movies">
                        {__("List Movies")}
                      </a>
                    </li>
                    <li {if $view == "movies" && $sub_view == "genres"}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/movies/genres">
                        {__("List Genres")}
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
            {/if}
            <!-- Movies -->

            <!-- Games -->
            {if $user->_is_admin || ($user->_is_moderator && $system['mods_games_permission'])}
              <li {if $view == "games"}class="active" {/if}>
                <a href="#games" data-bs-toggle="collapse" {if $view == "games"}aria-expanded="true" {/if}>
                  <i class="fa fa-gamepad fa-lg fa-fw mr10" style="color: #F44336"></i>{__("Games")}
                </a>
                <div class='collapse {if $view == "games"}show{/if}' id="games">
                  <ul>
                    <li {if $view == "games" && $sub_view == ""}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/games">
                        {__("List Games")}
                      </a>
                    </li>
                    <li {if $view == "games" && $sub_view == "genres"}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/games/genres">
                        {__("List Genres")}
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
            {/if}
            <!-- Games -->

          </ul>
        </div>
      </div>
      <!-- Modules -->

      <!-- Money -->
      {if $user->_is_admin || ($user->_is_moderator && $system['mods_ads_permission']) || ($user->_is_moderator && $system['mods_wallet_permission']) || ($user->_is_moderator && $system['mods_pro_permission']) || ($user->_is_moderator && $system['mods_affiliates_permission']) || ($user->_is_moderator && $system['mods_points_permission']) || ($user->_is_moderator && $system['mods_marketplace_permission']) || ($user->_is_moderator && $system['mods_funding_permission']) || ($user->_is_moderator && $system['mods_monetization_permission']) || ($user->_is_moderator && $system['mods_tips_permission'])}
        <div class="card mb15">
          <div class="card-header block-title">
            {__("Money")}
          </div>
          <div class="card-body with-nav">
            <ul class="side-nav">

              <!-- Earnings -->
              {if $user->_is_admin}
                <li {if $view == "earnings"}class="active" {/if}>
                  <a href="#earnings" data-bs-toggle="collapse" {if $view == "earnings"}aria-expanded="true" {/if}>
                    <i class="fa fa-chart-line fa-lg fa-fw mr10" style="color: #4CAF50"></i>{__("Earnings")}
                  </a>
                  <div class='collapse {if $view == "earnings"}show{/if}' id="earnings">
                    <ul>
                      <li {if $view == "earnings" && $sub_view == ""}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/earnings">
                          {__("Payments")}
                        </a>
                      </li>
                      <li {if $view == "earnings" && $sub_view == "commissions"}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/earnings/commissions">
                          {__("Commissions")}
                        </a>
                      </li>
                      <li {if $view == "earnings" && $sub_view == "packages"}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/earnings/packages">
                          {__("Packages Earnings")}
                        </a>
                      </li>
                      <li {if $view == "earnings" && $sub_view == "movies"}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/earnings/movies">
                          {__("Movies Earnings")}
                        </a>
                      </li>
                    </ul>
                  </div>
                </li>
              {/if}
              <!-- Earnings -->

              <!-- Ads -->
              {if $user->_is_admin || ($user->_is_moderator && $system['mods_ads_permission'])}
                <li {if $view == "ads"}class="active" {/if}>
                  <a href="#ads" data-bs-toggle="collapse" {if $view == "ads"}aria-expanded="true" {/if}>
                    <i class="fa fa-bullseye fa-lg fa-fw mr10" style="color: #4CAF50"></i>{__("Ads")}
                  </a>
                  <div class='collapse {if $view == "ads"}show{/if}' id="ads">
                    <ul>
                      <li {if $view == "ads" && $sub_view == ""}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/ads">
                          {__("Ads Settings")}
                        </a>
                      </li>
                      <li {if $view == "ads" && $sub_view == "users_ads"}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/ads/users_ads">
                          {__("List Users Ads")}
                        </a>
                      </li>
                      <li {if $view == "ads" && $sub_view == "system_ads"}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/ads/system_ads">
                          {__("List System Ads")}
                        </a>
                      </li>
                    </ul>
                  </div>
                </li>
              {/if}
              <!-- Ads -->

              <!-- Wallet -->
              {if $user->_is_admin || ($user->_is_moderator && $system['mods_wallet_permission'])}
                <li {if $view == "wallet"}class="active" {/if}>
                  <a href="#wallet" data-bs-toggle="collapse" {if $view == "wallet"}aria-expanded="true" {/if}>
                    <i class="fa fa-wallet fa-lg fa-fw mr10" style="color: #4CAF50"></i>{__("Wallet")}
                  </a>
                  <div class='collapse {if $view == "wallet"}show{/if}' id="wallet">
                    <ul>
                      <li {if $view == "wallet" && $sub_view == ""}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/wallet">
                          {__("Wallet Settings")}
                        </a>
                      </li>
                      <li {if $view == "wallet" && $sub_view == "payments"}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/wallet/payments">
                          {if $wallet_payments_insights}<span class="float-end badge rounded-pill bg-danger">{$wallet_payments_insights}</span>{/if}
                          {__("Payment Requests")}
                        </a>
                      </li>
                    </ul>
                  </div>
                </li>
              {/if}
              <!-- Wallet -->

              <!-- Pro System -->
              {if $user->_is_admin || ($user->_is_moderator && $system['mods_pro_permission'])}
                <li {if $view == "pro"}class="active" {/if}>
                  <a href="#pro" data-bs-toggle="collapse" {if $view == "pro"}aria-expanded="true" {/if}>
                    <i class="fa fa-cubes fa-lg fa-fw mr10" style="color: #4CAF50"></i>{__("Pro System")}
                  </a>
                  <div class='collapse {if $view == "pro"}show{/if}' id="pro">
                    <ul>
                      <li {if $view == "pro" && $sub_view == ""}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/pro">
                          {__("Pro Settings")}
                        </a>
                      </li>
                      <li {if $view == "pro" && $sub_view == "packages"}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/pro/packages">
                          {__("List Packages")}
                        </a>
                      </li>
                      <li {if $view == "pro" && $sub_view == "subscribers"}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/pro/subscribers">
                          {__("List Subscribers")}
                        </a>
                      </li>
                    </ul>
                  </div>
                </li>
              {/if}
              <!-- Pro System -->

              <!-- Affiliates -->
              {if $user->_is_admin || ($user->_is_moderator && $system['mods_affiliates_permission'])}
                <li {if $view == "affiliates"}class="active" {/if}>
                  <a href="#affiliates" data-bs-toggle="collapse" {if $view == "affiliates"}aria-expanded="true" {/if}>
                    <i class="fa fa-exchange-alt fa-lg fa-fw mr10" style="color: #4CAF50"></i>{__("Affiliates")}
                  </a>
                  <div class='collapse {if $view == "affiliates"}show{/if}' id="affiliates">
                    <ul>
                      <li {if $view == "affiliates" && $sub_view == ""}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/affiliates">
                          {__("Affiliates Settings")}
                        </a>
                      </li>
                      <li {if $view == "affiliates" && $sub_view == "payments"}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/affiliates/payments">
                          {if $affiliates_payments_insights}<span class="float-end badge rounded-pill bg-danger">{$affiliates_payments_insights}</span>{/if}
                          {__("Payment Requests")}
                        </a>
                      </li>
                    </ul>
                  </div>
                </li>
              {/if}
              <!-- Affiliates -->

              <!-- Points -->
              {if $user->_is_admin || ($user->_is_moderator && $system['mods_points_permission'])}
                <li {if $view == "points"}class="active" {/if}>
                  <a href="#points" data-bs-toggle="collapse" {if $view == "points"}aria-expanded="true" {/if}>
                    <i class="fa fa-piggy-bank fa-lg fa-fw mr10" style="color: #4CAF50"></i>{__("Points System")}
                  </a>
                  <div class='collapse {if $view == "points"}show{/if}' id="points">
                    <ul>
                      <li {if $view == "points" && $sub_view == ""}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/points">
                          {__("Points Settings")}
                        </a>
                      </li>
                      <li {if $view == "points" && $sub_view == "payments"}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/points/payments">
                          {if $points_payments_insights}<span class="float-end badge rounded-pill bg-danger">{$points_payments_insights}</span>{/if}
                          {__("Payment Requests")}
                        </a>
                      </li>
                    </ul>
                  </div>
                </li>
              {/if}
              <!-- Points -->

              <!-- Market -->
              {if $user->_is_admin || ($user->_is_moderator && $system['mods_marketplace_permission'])}
                <li {if $view == "market"}class="active" {/if}>
                  <a href="#market" data-bs-toggle="collapse" {if $view == "market"}aria-expanded="true" {/if}>
                    <i class="fa fa-shopping-bag fa-lg fa-fw mr10" style="color: #4CAF50"></i>{__("Marketplace")}
                  </a>
                  <div class='collapse {if $view == "market"}show{/if}' id="market">
                    <ul>
                      <li {if $view == "market" && $sub_view == ""}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/market">
                          {__("Market Settings")}
                        </a>
                      </li>
                      <li {if $view == "market" && $sub_view == "products"}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/market/products">
                          {__("List Products")}
                        </a>
                      </li>
                      <li {if $view == "market" && $sub_view == "orders"}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/market/orders">
                          {__("List Orders")}
                        </a>
                      </li>
                      <li {if $view == "market" && $sub_view == "categories"}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/market/categories">
                          {__("List Categories")}
                        </a>
                      </li>
                      <li {if $view == "market" && $sub_view == "payments"}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/market/payments">
                          {if $marketplace_payments_insights}<span class="float-end badge rounded-pill bg-danger">{$marketplace_payments_insights}</span>{/if}
                          {__("Payment Requests")}
                        </a>
                      </li>
                    </ul>
                  </div>
                </li>
              {/if}
              <!-- Market -->

              <!-- Funding -->
              {if $user->_is_admin || ($user->_is_moderator && $system['mods_funding_permission'])}
                <li {if $view == "funding"}class="active" {/if}>
                  <a href="#funding" data-bs-toggle="collapse" {if $view == "funding"}aria-expanded="true" {/if}>
                    <i class="fa fa-hand-holding-usd fa-lg fa-fw mr10" style="color: #4CAF50"></i>{__("Funding")}
                  </a>
                  <div class='collapse {if $view == "funding"}show{/if}' id="funding">
                    <ul>
                      <li {if $view == "funding" && $sub_view == ""}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/funding">
                          {__("Funding Settings")}
                        </a>
                      </li>
                      <li {if $view == "funding" && $sub_view == "payments"}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/funding/payments">
                          {if $funding_payments_insights}<span class="float-end badge rounded-pill bg-danger">{$funding_payments_insights}</span>{/if}
                          {__("Payment Requests")}
                        </a>
                      </li>
                      <li {if $view == "funding" && $sub_view == "requests"}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/funding/requests">
                          {__("Funding Requests")}
                        </a>
                      </li>
                    </ul>
                  </div>
                </li>
              {/if}
              <!-- Funding -->

              <!-- Monetization -->
              {if $user->_is_admin || ($user->_is_moderator && $system['mods_monetization_permission'])}
                <li {if $view == "monetization"}class="active" {/if}>
                  <a href="#monetization" data-bs-toggle="collapse" {if $view == "monetization"}aria-expanded="true" {/if}>
                    <i class="fa fa-coins fa-lg fa-fw mr10" style="color: #4CAF50"></i>{__("Monetization")}
                  </a>
                  <div class='collapse {if $view == "monetization"}show{/if}' id="monetization">
                    <ul>
                      <li {if $view == "monetization" && $sub_view == ""}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/monetization">
                          {__("Monetization Settings")}
                        </a>
                      </li>
                      <li {if $view == "monetization" && $sub_view == "payments"}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/monetization/payments">
                          {if $monetization_payments_insights}<span class="float-end badge rounded-pill bg-danger">{$monetization_payments_insights}</span>{/if}
                          {__("Payment Requests")}
                        </a>
                      </li>
                    </ul>
                  </div>
                </li>
              {/if}
              <!-- Monetization -->

              <!-- Tips -->
              {if $user->_is_admin || ($user->_is_moderator && $system['mods_tips_permission'])}
                <li {if $view == "tips"}class="active" {/if}>
                  <a href="{$system['system_url']}/{$control_panel['url']}/tips">
                    <i class="fa fa-dollar-sign fa-lg fa-fw mr10" style="color: #4CAF50"></i>{__("Tips")}
                  </a>
                </li>
              {/if}
              <!-- Tips -->

            </ul>
          </div>
        </div>
      {/if}
      <!-- Money -->

      <!-- Payments -->
      {if $user->_is_admin || $user->_is_moderator && $system['mods_payments_permission']}
        <div class="card mb15">
          <div class="card-header block-title">
            {__("Payments")}
          </div>
          <div class="card-body with-nav">
            <ul class="side-nav">

              <!-- CoinPayments -->
              <li {if $view == "coinpayments"}class="active" {/if}>
                <a href="{$system['system_url']}/{$control_panel['url']}/coinpayments">
                  <i class="fab fa-bitcoin fa-lg fa-fw mr10" style="color: #4CAF50"></i>{__("CoinPayments")}
                </a>
              </li>
              <!-- CoinPayments -->

              <!-- Bank Receipts -->
              <li {if $view == "bank"}class="active" {/if}>
                <a href="{$system['system_url']}/{$control_panel['url']}/bank">
                  {if $bank_transfers_insights}<span class="float-end badge rounded-pill bg-danger">{$bank_transfers_insights}</span>{/if}
                  <i class="fa fa-university fa-lg fa-fw mr10" style="color: #4CAF50"></i>{__("Bank Receipts")}
                </a>
              </li>
              <!-- Bank Receipts -->

            </ul>
          </div>
        </div>
      {/if}
      <!-- Payments -->

      <!-- Developers -->
      {if $user->_is_admin || $user->_is_moderator && $system['mods_developers_permission']}
        <div class="card mb15">
          <div class="card-header block-title">
            {__("Developers")}
          </div>
          <div class="card-body with-nav">
            <ul class="side-nav">

              <!-- Developers -->
              <li {if $view == "developers"}class="active" {/if}>
                <a href="#developers" data-bs-toggle="collapse" {if $view == "developers"}aria-expanded="true" {/if}>
                  <i class="fa fa-cubes fa-lg fa-fw mr10" style="color: #ffc107"></i>{__("Developers")}
                </a>
                <div class='collapse {if $view == "developers"}show{/if}' id="developers">
                  <ul>
                    <li {if $view == "developers" && $sub_view == ""}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/developers">
                        {__("Developers Settings")}
                      </a>
                    </li>
                    <li {if $view == "developers" && $sub_view == "apps"}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/developers/apps">
                        {__("List Apps")}
                      </a>
                    </li>
                    <li {if $view == "developers" && $sub_view == "categories"}class="active" {/if}>
                      <a href="{$system['system_url']}/{$control_panel['url']}/developers/categories">
                        {__("List Categories")}
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
              <!-- Developers -->

            </ul>
          </div>
        </div>
      {/if}
      <!-- Developers -->

      <!-- Tools -->
      {if $user->_is_admin || ($user->_is_moderator && $system['mods_reports_permission']) || ($user->_is_moderator && $system['mods_blacklist_permission']) || ($user->_is_moderator && $system['mods_verifications_permission'])}
        <div class="card mb15">
          <div class="card-header block-title">
            {__("Tools")}
          </div>
          <div class="card-body with-nav">
            <ul class="side-nav">

              <!-- Reports -->
              {if $user->_is_admin || ($user->_is_moderator && $system['mods_reports_permission'])}
                <li {if $view == "reports"}class="active" {/if}>
                  <a href="#reports" data-bs-toggle="collapse" {if $view == "reports"}aria-expanded="true" {/if}>
                    <i class="fa fa-exclamation-triangle fa-lg fa-fw mr10" style="color: #03A9F4"></i>{__("Reports")}
                  </a>
                  <div class='collapse {if $view == "reports"}show{/if}' id="reports">
                    <ul>
                      <li {if $view == "reports" && $sub_view == ""}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/reports">
                          {if $reports_insights}<span class="float-end badge rounded-pill bg-danger">{$reports_insights}</span>{/if}
                          {__("List reports")}
                        </a>
                      </li>
                      <li {if $view == "reports" && $sub_view == "categories"}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/reports/categories">
                          {__("List Categories")}
                        </a>
                      </li>
                    </ul>
                  </div>
                </li>
              {/if}
              <!-- Reports -->

              <!-- Blacklist -->
              {if $user->_is_admin || ($user->_is_moderator && $system['mods_blacklist_permission'])}
                <li {if $view == "blacklist"}class="active" {/if}>
                  <a href="{$system['system_url']}/{$control_panel['url']}/blacklist">
                    <i class="fa fa-minus-circle fa-lg fa-fw mr10" style="color: #03A9F4"></i>{__("Blacklist")}
                  </a>
                </li>
              {/if}
              <!-- Blacklist -->

              <!-- Verification -->
              {if $user->_is_admin || ($user->_is_moderator && $system['mods_verifications_permission'])}
                <li {if $view == "verification"}class="active" {/if}>
                  <a href="#verification" data-bs-toggle="collapse" {if $view == "verification"}aria-expanded="true" {/if}>
                    <i class="fa fa-check-circle fa-lg fa-fw mr10" style="color: #03A9F4"></i>{__("Verification")}
                  </a>
                  <div class='collapse {if $view == "verification"}show{/if}' id="verification">
                    <ul>
                      <li {if $view == "verification" && $sub_view == ""}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/verification">
                          {if $verification_requests_insights}<span class="float-end badge rounded-pill bg-danger">{$verification_requests_insights}</span>{/if}
                          {__("List Requests")}
                        </a>
                      </li>
                      <li {if $view == "verification" && $sub_view == "users"}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/verification/users">
                          {__("List Verified Users")}
                        </a>
                      </li>
                      <li {if $view == "verification" && $sub_view == "pages"}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/verification/pages">
                          {__("List Verified Pages")}
                        </a>
                      </li>
                    </ul>
                  </div>
                </li>
              {/if}
              <!-- Verification -->

              {if $user->_is_admin}
                <!-- Tools -->
                <li {if $view == "tools"}class="active" {/if}>
                  <a href="#tools" data-bs-toggle="collapse" {if $view == "tools"}aria-expanded="true" {/if}>
                    <i class="fa fa-toolbox fa-lg fa-fw mr10" style="color: #03A9F4"></i>{__("Tools")}
                  </a>
                  <div class='collapse {if $view == "tools"}show{/if}' id="tools">
                    <ul>
                      <li {if $view == "tools" && $sub_view == "faker"}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/tools/faker">
                          {__("Fake Generator")}
                        </a>
                      </li>
                      <li {if $view == "tools" && $sub_view == "auto-connect"}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/tools/auto-connect">
                          {__("Auto Connect")}
                        </a>
                      </li>
                      <li {if $view == "tools" && $sub_view == "garbage-collector"}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/tools/garbage-collector">
                          {__("Garbage Collector")}
                        </a>
                      </li>
                      <li {if $view == "tools" && $sub_view == "backups"}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/tools/backups">
                          {__("Backup Database & Files")}
                        </a>
                      </li>
                      <li {if $view == "tools" && $sub_view == "cronjob"}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/tools/cronjob">
                          {__("Cronjob")}
                        </a>
                      </li>
                      <li {if $view == "tools" && $sub_view == "reset"}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/tools/reset">
                          {__("Factory Reset")}
                        </a>
                      </li>
                    </ul>
                  </div>
                </li>
                <!-- Tools -->
              {/if}

            </ul>
          </div>
        </div>
      {/if}
      <!-- Tools -->

      <!-- Customization -->
      {if $user->_is_admin || ($user->_is_moderator && $system['mods_customization_permission'])}
        <div class="card mb15">
          <div class="card-header block-title">
            {__("Customization")}
          </div>
          <div class="card-body with-nav">
            <ul class="side-nav">

              <!-- Custom Fields -->
              <li {if $view == "custom_fields"}class="active" {/if}>
                <a href="{$system['system_url']}/{$control_panel['url']}/custom_fields">
                  <i class="fa fa-bars fa-lg fa-fw mr10" style="color: #FF5722"></i>{__("Custom Fields")}
                </a>
              </li>
              <!-- Custom Fields -->

              <!-- Static Pages -->
              <li {if $view == "static"}class="active" {/if}>
                <a href="{$system['system_url']}/{$control_panel['url']}/static">
                  <i class="fa fa-file fa-lg fa-fw mr10" style="color: #FF5722"></i>{__("Static Pages")}
                </a>
              </li>
              <!-- Static Pages -->

              <!-- Colored Posts -->
              <li {if $view == "colored_posts"}class="active" {/if}>
                <a href="{$system['system_url']}/{$control_panel['url']}/colored_posts">
                  <i class="fa fa-palette fa-lg fa-fw mr10" style="color: #FF5722"></i>{__("Colored Posts")}
                </a>
              </li>
              <!-- Colored Posts -->

              <!-- Widgets -->
              <li {if $view == "widgets"}class="active" {/if}>
                <a href="{$system['system_url']}/{$control_panel['url']}/widgets">
                  <i class="fa fa-puzzle-piece fa-lg fa-fw mr10" style="color: #FF5722"></i>{__("Widgets")}
                </a>
              </li>
              <!-- Widgets -->

              <!-- Reactions -->
              <li {if $view == "reactions"}class="active" {/if}>
                <a href="{$system['system_url']}/{$control_panel['url']}/reactions">
                  <i class="fa fa-smile fa-lg fa-fw mr10" style="color: #FF5722"></i>{__("Reactions")}
                </a>
              </li>
              <!-- Reactions -->

              <!-- Emojis -->
              <li {if $view == "emojis"}class="active" {/if}>
                <a href="{$system['system_url']}/{$control_panel['url']}/emojis">
                  <i class="fa fa-grin-tears fa-lg fa-fw mr10" style="color: #FF5722"></i>{__("Emojis")}
                </a>
              </li>
              <!-- Emojis -->

              <!-- Stickers -->
              <li {if $view == "stickers"}class="active" {/if}>
                <a href="{$system['system_url']}/{$control_panel['url']}/stickers">
                  <i class="fa fa-hand-peace fa-lg fa-fw mr10" style="color: #FF5722"></i>{__("Stickers")}
                </a>
              </li>
              <!-- Stickers -->

              <!-- Gifts -->
              <li {if $view == "gifts"}class="active" {/if}>
                <a href="{$system['system_url']}/{$control_panel['url']}/gifts">
                  <i class="fa fa-gift fa-lg fa-fw mr10" style="color: #FF5722"></i>{__("Gifts")}
                </a>
              </li>
              <!-- Gifts -->

            </ul>
          </div>
        </div>
      {/if}
      <!-- Customization -->

      <!-- Reach -->
      {if $user->_is_admin || ($user->_is_moderator && $system['mods_reach_permission'])}
        <div class="card mb15">
          <div class="card-header block-title">
            {__("Reach")}
          </div>
          <div class="card-body with-nav">
            <ul class="side-nav">

              <!-- Announcements -->
              <li {if $view == "announcements"}class="active" {/if}>
                <a href="{$system['system_url']}/{$control_panel['url']}/announcements">
                  <i class="fa fa-bullhorn fa-lg fa-fw mr10" style="color: #009688"></i>{__("Announcements")}
                </a>
              </li>
              <!-- Announcements -->

              <!-- Notifications -->
              <li {if $view == "notifications"}class="active" {/if}>
                <a href="{$system['system_url']}/{$control_panel['url']}/notifications">
                  <i class="fa fa-bell fa-lg fa-fw mr10" style="color: #009688"></i>{__("Mass Notifications")}
                </a>
              </li>
              <!-- Notifications -->

              <!-- Newsletter -->
              <li {if $view == "newsletter"}class="active" {/if}>
                <a href="{$system['system_url']}/{$control_panel['url']}/newsletter">
                  <i class="fa fa-paper-plane fa-lg fa-fw mr10" style="color: #009688"></i>{__("Newsletter")}
                </a>
              </li>
              <!-- Newsletter -->

            </ul>
          </div>
        </div>
      {/if}
      <!-- Reach -->

      <!-- Plugins -->
      {if $user->_is_admin}
        <div class="card">
          <div class="card-header block-title">
            {__("Plugins")}
          </div>
          <div class="card-body with-nav">
            <ul class="side-nav">

              <!-- Merits -->
              {if $user->_is_admin}
                <li {if $view == "merits"}class="active" {/if}>
                  <a href="#merits" data-bs-toggle="collapse" {if $view == "merits"}aria-expanded="true" {/if}>
                    <i class="fa fa-star fa-lg fa-fw mr10" style="color: #03A9F4"></i>{__("Merits")}
                  </a>
                  <div class='collapse {if $view == "merits"}show{/if}' id="merits">
                    <ul>
                      <li {if $view == "merits" && $sub_view == ""}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/merits">
                          {__("Merits Settings")}
                        </a>
                      </li>
                      <li {if $view == "merits" && $sub_view == "categories"}class="active" {/if}>
                        <a href="{$system['system_url']}/{$control_panel['url']}/merits/categories">
                          {__("List Categories")}
                        </a>
                      </li>
                    </ul>
                  </div>
                </li>
              {/if}
              <!-- Merits -->

            </ul>
          </div>
        </div>
      {/if}
      <!-- Plugins -->

      <!-- Apps -->
      {if $user->_is_admin}
        <div class="card">
          <div class="card-header block-title">
            {__("Apps")}
          </div>
          <div class="card-body with-nav">
            <ul class="side-nav">

              <!-- PWA -->
              <li {if $view == "pwa"}class="active" {/if}>
                <a href="{$system['system_url']}/{$control_panel['url']}/pwa">
                  <i class="fa-regular fa-window-restore fa-lg fa-fw mr10" style="color: #5e72e4"></i>{__("PWA")}
                </a>
              </li>
              <!-- PWA -->

              <!-- APIs Settings -->
              <li {if $view == "apis"}class="active" {/if}>
                <a href="{$system['system_url']}/{$control_panel['url']}/apis">
                  <i class="fa-solid fa-shapes fa-lg fa-fw mr10" style="color: #5e72e4"></i>{__("APIs Settings")}
                </a>
              </li>
              <!-- APIs Settings -->

              <!-- Native Apps -->
              <li {if $view == "apps"}class="active" {/if}>
                <a href="{$system['system_url']}/{$control_panel['url']}/apps">
                  <i class="fa-solid fa-mobile fa-lg fa-fw mr10" style="color: #5e72e4"></i>{__("Native Apps")}
                </a>
              </li>
              <!-- Native Apps -->

            </ul>
          </div>
        </div>
      {/if}
      <!-- Apps -->



      <!-- System -->
      {if $user->_is_admin}
        <div class="card">
          <div class="card-header block-title">
            {__("Info")}
          </div>
          <div class="card-body with-nav">
            <ul class="side-nav">

              <!-- Changelog -->
              <li {if $view == "changelog"}class="active" {/if}>
                <a href="{$system['system_url']}/{$control_panel['url']}/changelog">
                  <i class="fa fa-stopwatch fa-lg fa-fw mr10" style="color: #795548"></i>{__("Changelog")}
                </a>
              </li>
              <!-- Changelog -->

              <!-- Build -->
              <li>
                <div class="static">
                  <i class="fa fa-copyright fa-lg fa-fw mr10" style="color: #795548"></i>{__("Build")} v{$system['system_version']}
                </div>
              </li>
              <!-- Build -->

            </ul>
          </div>
        </div>
      {/if}
      <!-- System -->

    </div>
    <!-- left panel -->

    <!-- right panel -->
    <div class="col-md-8 col-lg-9 sg-offcanvas-mainbar">
      {include file="admin.$view.tpl"}
    </div>
    <!-- right panel -->

  </div>
</div>
<!-- page content -->

{include file='_footer.tpl'}