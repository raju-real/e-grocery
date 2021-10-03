<template>

    <div class="col-md-12" style="margin-top: 20px;">
        <div class="tile">
            <div class="tile-body">
                <table id="category-table" class="table table-striped table-bordered
                nowrap" style="width:100%">
                    <thead>
                    <tr>
                        <th class="text-center">Sl.No</th>
                        <th class="text-center">Name</th>
                        <th class="text-center">Image</th>
                        <th class="text-center">Status</th>
                        <th class="text-center">Products</th>
                        <th class="text-center">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr v-show="promotions.length" v-for="(promotion,index) in promotions"
                        :key="promotion.id">
                        <td class="text-center">{{ index + 1 }}</td>
                        <td class="text-center">
                            {{ promotion.name }}
                        </td>
                        <td class="text-center">
                            <img :src="'/./images/promotion/'+promotion.image"
                                 class="img-responsive" alt="Image" style="height: 80px;width: 100px;">
                        </td>
                        <td class="text-center">
                            {{ promotion.status == 1? "Active" : "Inactive" }}
                        </td>
                        <td class="text-center">
                            <button  class="btn btn-success">
                                View Products
                            </button>
                        </td>
                        <td class="text-center">

                        </td>
                    </tr>
                    </tbody>
                    <tfoot>
                    <tr>
                        <th class="text-center">Sl.No</th>
                        <th class="text-center">Name</th>
                        <th class="text-center">Image</th>
                        <th class="text-center">Status</th>
                        <th class="text-center">Products</th>
                        <th class="text-center">Action</th>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </div>
        <vue-progress-bar></vue-progress-bar>
        <vue-snotify></vue-snotify>
    </div>
</template>

<script>
    export default {
        name: "List",
        mounted(){
            this.getAllPromotion();
        },
        data(){
            return {
                promotions : [],
            }
        },
        methods: {
            getAllPromotion(){
                this.$Progress.start();
                axios.get('/super/promotion')
                    .then(response=>{
                        this.promotions = response.data;
                    })
            }
        }
    }
</script>