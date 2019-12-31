<script>
export let user

import Profile from './Profile.svelte'
import PinnedItems from './PinnedItems.svelte'
</script>

<div id="Home">
  <Profile user={user}/>
  <PinnedItems pinnedItems={user.pinnedItems.nodes}/>
</div>
