<div class="alerts">
    @foreach ($alerts as $alert)
        @if ( $alert->name != 'missing-storage-symlink')
            <div class="alert alert-{{ $alert->type }} alert-name-{{ $alert->name }}">
                @foreach($alert->components as $component)
                    <?php echo $component->render(); ?>
                @endforeach
            </div>
        @endif
    @endforeach
</div>
