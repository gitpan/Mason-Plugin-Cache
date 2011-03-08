package Mason::Plugin::Cache::Filters;
BEGIN {
  $Mason::Plugin::Cache::Filters::VERSION = '0.03';
}
use Mason::PluginRole;

method Cache ( $key, $set_options, %cache_options ) {
    Mason::DynamicFilter->new(
        filter => sub {
            $self->cache(%cache_options)->compute( $key, $_[0], $set_options );
        }
    );
}

1;
