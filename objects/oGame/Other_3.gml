/// @description Insert description here
// You can write your code in this editor

physics_fixture_delete(global.fixCANTMOVE);
physics_fixture_delete(global.fixMOVE);


// Free up Particle stuff from memory
if (part_system_exists(global.sysParticles))
{
    part_system_destroy(global.sysParticles);
}

if (part_type_exists(global.partHit))
{
    part_type_destroy(global.partHit);
}
