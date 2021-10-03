<template>
    <div class="col-md-12">
        <!--<a href="{{route('super.send_image') }}" class="btn btn-info">Send Image</a>-->
        <div class="tile">
            <h3 class="tile-title">
                <div class="row">

                <div class="col-md-2">
                    <strong>User Search By :</strong>
                </div>
                <div class="col-md-3">
                    <select class="form-control" id="fields" v-model="queryField">
                        <option value="mobile">Mobile</option>
                        <option value="name">Name</option>
                        <option value="email">Email</option>
                    </select>
                </div>
                <div class="col-md-7">
                    <input v-model="query" type="text" class="form-control" name="" placeholder="Search">
                </div>
            </div>

            </h3>
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>SL</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Mobile</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <tr v-show="users.length" v-for="(user,index) in users">
                    <td>{{ index + 1 }}</td>
                    <td>{{ user.name }}</td>
                    <td>{{ user.email }}</td>
                    <td>{{ user.mobile }}</td>
                    <td>
                        <button @click="openModal(user)">
                            <img src="/../assets/images/message.png" alt="" style="height: 80px;width: 80px;">
                        </button>
                    </td>
                </tr>
                </tbody>

            </table>
            <pagination
                    v-if="pagination.last_page > 1"
                    :pagination="pagination"
                    :offset="5"
                    @paginate="query === '' ? getUser() : searchUser()">
            </pagination>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="userModal" tabindex="-1" role="dialog" aria-labelledby="userModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form @submit.prevent="sendMessage"
                              @keydown="form.onKeydown($event)">
                            <div class="form-group">
                                <label>Mobile</label>
                                <input v-model="form.mobile" type="text" name="mobile"
                                       class="form-control" :class="{ 'is-invalid': form.errors.has('mobile') }" :readonly="form.mobile" value="form.mobile">
                                <has-error :form="form" field="mobile"></has-error>
                            </div>
                            <div class="form-group">
                                <label>Subject</label>
                                <input v-model="form.subject" type="text" name="subject"
                                       class="form-control" :class="{ 'is-invalid': form.errors.has('subject') }" >
                                <has-error :form="form" field="subject"></has-error>
                            </div>
                            <div class="form-group">
                                <label>Message</label>
                                <textarea v-model="form.message" type="text" name="message"
                                          class="form-control" :class="{ 'is-invalid': form.errors.has('message') }"></textarea>
                                <has-error :form="form" field="message"></has-error>
                            </div>

                            <button :disabled="form.busy" type="submit" class="btn btn-primary btn-block">Send Sms</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <vue-progress-bar></vue-progress-bar>
        <vue-snotify></vue-snotify>
    </div>

</template>

<script>
    export default {
        name: "Dashboard",
        mounted(){
            console.log('Super Admin Dashboard');
            this.getUser();
        },
        data(){
            return {
                users : [],
                user : {},
                pagination : {
                    current_page : 1,
                },
                query : '',
                queryField : 'mobile',
                form : new Form({
                    mobile : '',
                    subject : '',
                    message : ''
                }),
            }
        },
        watch:{
            query:function(newQ,old){
                if(newQ === ''){
                    this.getUser();
                } else {
                    this.searchUser();
                }
            }
        },
        methods: {
            getUser(){
                axios.get('/super/get_user?page='+this.pagination.current_page)
                    .then(response=>{
                        this.users = response.data.data;
                        this.pagination = response.data;
                }).catch(error=>{

                });
            },
            searchUser(){
                this.$Progress.start();
                axios.get('/super/search_user/'+this.queryField+'/'
                    +this.query+'?page='+this.pagination.current_page)
                    .then(response => {
                        this.users = response.data.data;
                        this.pagination = response.data;
                        this.$Progress.finish();
                    }). catch(error => {
                    console.log(error);
                    this.$Progress.fail();
                });
            },
            openModal(user){
                $('#userModal').modal('show');
                this.form.mobile = user.mobile;
                this.form.subject = '';
                //this.form.fill(user);
            },
            sendMessage(){
                this.$Progress.start();
                this.form.busy = true;
                this.form.post('/super/user_message_send')
                    .then(response=>{
                        $("#userModal").modal("hide");
                        if (this.form.successful) {
                            console.log(response.data.success);
                            this.$Progress.finish();
                            this.$snotify.success(response.data.success, "Success");
                        } else {
                            this.$Progress.fail();
                            this.$snotify.error(
                                "Something went wrong try again later.",
                                "Error"
                            );
                        }
                    }).catch(error=>{
                    this.$Progress.fail();
                    this.$snotify.error(error,"Error");
                });
            }
        },

    }
</script>