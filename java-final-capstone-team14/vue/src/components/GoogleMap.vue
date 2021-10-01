<template>
    <div>
        <gmap-map
            :center="center"
            :zoom="14"
            style="width: 500px; height: 300px;"
        >
            <gmap-marker
                :position="{lat: this.latitude, lng: this.longitude}"
            />
        </gmap-map>
    </div>
</template>

<script>
export default {
    name: "GoogleMap",
    props: {
        location: Object
    },
    data() {
        return {
            latitude: 0,
            longitude: 0,
            center: {}
        }
    },
    created() {
        this.center = {lat: this.location.latitude, lng: this.location.longitude}
        this.latitude = this.location.latitude;
        this.longitude = this.location.longitude
    }
}
</script>

<style>
    
</style>