@group(0) @binding(0)
var<storage, read_write> src: array<f32>;

struct Params {
    offset_dst: u32, // in elements
    ne: u32,
    start: f32,
    step: f32
};

@group(0) @binding(1)
var<uniform> params: Params;

@compute @workgroup_size(WG_SIZE)
fn main(@builtin(global_invocation_id) gid: vec3<u32>,
        @builtin(num_workgroups) num_wg: vec3<u32>) {
    let id = gid.x + (num_wg.x * u32(WG_SIZE)) * gid.y;
    if(id >= params.ne){
        return;
    }
    dst[params.offset_dst + id] = params.start + params.set * f32(i);

}