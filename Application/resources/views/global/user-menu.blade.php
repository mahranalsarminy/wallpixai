<div class="drop-down user-menu ms-3" data-dropdown="" data-dropdown-position="top">
    <div class="drop-down-btn">
        <img src="{{ asset(authUser()->avatar) }}" alt="{{ authUser()->name }}" class="user-img">
        <span class="user-name">{{ authUser()->name }}</span>
        <i class="fa fa-angle-down ms-2"></i>
    </div>
    <div class="drop-down-menu">
        <a href="{{ route('user.gallery.index') }}" class="drop-down-item">
            <i class="fa-regular fa-images"></i>
            <span>{{ lang('Gallery', 'gallery') }}</span>
        </a>
        <a href="{{ route('user.settings.index') }}" class="drop-down-item">
            <i class="fa fa-cog"></i>
            <span>{{ lang('Settings', 'account') }}</span>
        </a>
        <a href="#" onclick="event.preventDefault(); document.getElementById('logout-form').submit();"
            class="drop-down-item text-danger">
            <i class="fa fa-power-off"></i>
            <span>{{ lang('Logout', 'auth') }}</span>
        </a>
    </div>
</div>
<form id="logout-form" class="d-inline" action="{{ route('logout') }}" method="POST">
    @csrf
</form>
