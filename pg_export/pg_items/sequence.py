from pg_export.pg_items.item import Item
from pg_export.acl import acl_to_grants


class Sequence (Item):
    template = 'out/sequence.sql'
    directory = 'sequences'

    def __init__(self, src, version):
        super(Sequence, self).__init__(src, version)
        self.grants = acl_to_grants(self.acl, 'sequence', self.full_name)
